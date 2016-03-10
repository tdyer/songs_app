class SongsController < ApplicationController

  # GET /songs
  def index
    # Create an instance variable @songs
    # that will be an Array of all the Songs in the
    # DB. Actually an Array of Song object/models.

    @songs = Song.all

    respond_to do |format|
      # HTML, render the view
      format.html
      # XML, convert the Array of songs
      # to xml
      format.xml { render xml: @songs }
      # JSON, convert the Array of songs
      # to JSON
      format.json { render json: @songs }
    end
  end

  # GET /songs/:id
  def show
    # Find one song by it's id
    @song = Song.find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render xml: @song}
      format.json {render json: @song}
    end
  end

  # GET /songs/new
  # Generate a HTML Form to create a new Song.
  def new
    # Create a song with no attributes in memory ONLY!!!
    @song = Song.new

    # invokes the app/views/songs/new.html.erb

  end

  # POST /songs
  # STEP 1: Create a Song given JSON data
  def create
    # create a new Song object/model using the
    # data sent within the POST HTTP Request

    # params hash
    #  {song: {title: '1999', artist_name: 'Prince', duration: 240, price: 139}}
    # params[:song] = {title: '1999', artist_name: 'Prince', duration: 240, price: 139}
    # Song.new({title: '1999', artist_name: 'Prince', duration: 240, price: 139})
    @song = Song.new(song_params)

    respond_to do |format|
      # Song#save method will generate the SQL INSERT statement
      # to create a new row in the songs table.
      if  @song.save
        # Successfully saved a song
        # redirect_to generates a HTTP Redirect to /songs/:id
        format.html { redirect_to songs_url, notice: 'Song was successfully created'}
        # render the app/views/show.html.erb, HTTP Status 201
        format.json { render :show, status: :created, location: @song}
        format.xml { render :show, status: :created, location: @song}
        # render json: @song, status: :created, location: songs_url
      else
        # Save to DB FAILED
        format.html {render :new}
        format.json {render json: @song.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  # Defines what data a HTTP POST can send to create a song
  def song_params
    params.require(:song).permit(:title, :artist_name, :duration, :price)
  end

end
