% include('header.tpl')

<div class="notification is-info">
  Jegliche Angaben sind optional. Du kannst die Umfrage auch mehrmals ausf&uuml;llen, falls Du bspw. Deine Meinung &auml;nderst.
</div>

<div class="notification is-danger">
  Diese Umfrage l&auml;uft bis zum <strong>Sonntag, den 18. April 2021</strong>.
</div>


<form action="/datenverarbeitung?token={{token}}" method="post">

<div class="box">
<h3 class="title is-3">Pers&ouml;nliches</h3>

<div class="field">
  <label class="label">Name</label>
  <div class="control">
    <input class="input" type="text" placeholder="Hackerman" name="name">
  </div>
</div>

<div class="field">
  <label class="label">Seit wann bist Du im Hackspace aktiv?</label>
<div class="control">
  <div class="select">
    <select name="active">
      <option>Keine Angabe</option>
      <option>2021</option>
      <option>2020</option>
      <option>2019</option>
      <option>2018</option>
      <option>2017</option>
      <option>2016</option>
      <option>2015</option>
      <option>2014</option>
      <option>2013</option>
    </select>
  </div>
</div>
</div>


<div class="field">
  <div class="control">
  <strong>Bist Du Mitglied im Verein?</strong> </br>
<label class="checkbox">
  <input type="checkbox" name="membership">
  Ja
</label>
  </div>
</div>


<div class="field">
  <label class="label">Was sind Deine Interessen?</label>
  <div class="control">
    <input class="input" type="text" placeholder="Hardware, Software, Socialising…" name="interests">
  </div>
</div>

</div>

<div class="box">

<h3 class="title is-3">Spezifisches</h3>

<div class="field">
  <label class="label">Was findest Du gut am Hackspace?</label>
  <div class="control">
    <textarea class="textarea" placeholder="Deine Antwort…" name="positive"></textarea>
  </div>
</div>

<div class="field">
  <label class="label">Was st&ouml;rt Dich am Hackspace?</label>
  <div class="control">
    <textarea class="textarea" placeholder="Deine Antwort…" name="negative"></textarea>
  </div>
</div>

</div>

<div class="field">
  <div class="control">
    <button class="button is-link">Abschicken</button>
  </div>
</div>



</form>

% include('footer.tpl')
