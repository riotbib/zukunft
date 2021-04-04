% include('header.tpl')

<div class="box">
  Bitte f&uuml;lle diese Umfrage nur aus, wenn du Dich dem <strong>Hackspace Marburg</strong> zugeh&ouml;rig f&uuml;hlst. Das Ausf&uuml;llen dauert zwischen 5 und 15 Minuten.
</div>

<form action="/">

<div class="field">
  <label class="label">Gebe den Token aus der Einladung ein.</label>
  <div class="control">
    <input class="input" type="text" placeholder="Tokey…" name="token">
  </div>
</div>


<div class="field">
  <div class="control">
    <button class="button is-link">Los geht's</button>
  </div>
</div>

</form>
% include('footer.tpl')
