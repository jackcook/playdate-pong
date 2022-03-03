import "globals"

function playSound(sound)
	if sound == kSoundBounce then
		-- C4 at volume 1 for 0.2 seconds
		playdate.sound.synth.new():playMIDINote(kNoteC4, 1, 0.2)
	elseif sound == kSoundFail then
		for i = 1, 5 do
			playdate.sound.synth.new():playMIDINote(kNoteC4, 1, 0.02, playdate.sound.getCurrentTime() + 0.02 * i * 2)
		end
	end
end