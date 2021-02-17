use_osc "localhost", 4560


loop do
  comienzo = sync "/osc*/comienza"
  sleep 0.1
  print (comienzo)
  break if (comienzo == ["Start"])
end

live_loop :tambores do ||
  with_fx :reverb, room: 0 do
    sample :loop_safari, amp: 0.4, beat_stretch: 12
    sleep 12
  end
end

live_loop :pillarOscSegundoParrafo do
  use_real_time
  a = sync "/osc*/segundoParrafo"
  sync :tambores
  with_fx :reverb do
    live_loop :segundoParrafo do
      if(a == [1]) then
        sample :bass_trance_c, amp: 0.3, beat_stretch: 6, pitch: 4, attack: 0.1, pan: -0.3
        sleep 6
        sample :bass_trance_c, amp: 0.3, beat_stretch: 6, pitch: 1, attack: 0.1, pan: 0.3
        sleep 6
      elsif(a == [2]) then
        sample :guit_em9, amp: 0.15, beat_stretch: 3, pitch: 4, release: 2
        sleep 3
        sample :guit_em9, amp: 0.15, beat_stretch: 3, pitch: 4, release: 2
        sleep 3
        sample :guit_em9, amp: 0.15, beat_stretch: 3, pitch: 1, release: 2
        sleep 3
        sample :guit_em9, amp: 0.15, beat_stretch: 3, pitch: 1, release: 2
        sleep 3
      else
        sample :guit_e_fifths, amp: 0.2, beat_stretch: 6, pitch: 1, release: 3, pan: -0.3
        sleep 6
        sample :guit_e_fifths, amp: 0.2, beat_stretch: 6, pitch: 4, release: 3, pan: 0.3
        sleep 6
      end
    end
  end
end


live_loop :pillarOscTercerParrafo do
  use_real_time
  b = sync "/osc*/tercerParrafo"
  sync :tambores
  with_fx :reverb do
    
    live_loop :tercerParrafo do
      if(b == [1]) then
        sample :ambi_dark_woosh, amp: 0.2, beat_stretch: 6
        sleep 6
        sample :ambi_haunted_hum, amp: 0.2, beat_stretch: 6
        sleep 6
      elsif(b == [2]) then
        sample :drum_cowbell, amp: 0.3, beat_stretch: 6
        sleep 6
        sample :drum_cowbell, amp: 0.3, pitch: 4, beat_stretch: 6
        sleep 6
      elsif(b == [3]) then
        sample :elec_tick, rate: rrand(-0.5, 1.5), amp: 0.5
        sleep 2
      elsif(b == [4]) then
        sample :mehackit_robot7, rate: -1, beat_stretch: 6, amp: 0.6, pitch: 4
        sleep 6
      elsif(b == [5]) then
        sample :misc_cineboom, beat_stretch: 6, rate: 0.7, amp: 0.3
        sleep 6
        sample :misc_cineboom, beat_stretch: 6, rate: -1, amp: 0.3
        sleep 6
      elsif(b == [6]) then
        sample :drum_cowbell, amp: 0.3,pitch: 4, beat_stretch: 6
        sleep 6
        sample :drum_cowbell, amp: 0.3,  beat_stretch: 6
        sleep 6
        
        
      end
    end
  end
end
