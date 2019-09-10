From: hverkuil@xs4all.nl (Hans Verkuil)
Date: Tue, 10 Sep 2019 08:53:22 +0200
Subject: [Linux-kernel-mentees] [PATCH] cec-compliance: system audio
	control
In-Reply-To: <20190909202030.82287-1-c0d1n61at3@gmail.com>
References: <20190909202030.82287-1-c0d1n61at3@gmail.com>
Message-ID: <8f5fc753-35e4-4b51-0341-f7d1e6100890@xs4all.nl>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190910065322.UxFb7Bm53g-ZjgJ2VWKKpMS8smSyD93aD2WvjZUzBvs@z>

On 9/9/19 10:20 PM, Jiunn Chang wrote:
> Add comment block documenting tests not included from section 13.15 of
> the HDMI CEC 1.4b specification.  This section outlines the System Audio
> Control feature.
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> ---
>  utils/cec-compliance/cec-test-audio.cpp | 30 +++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
> index 2bc24daf..e0cdb9dc 100644
> --- a/utils/cec-compliance/cec-test-audio.cpp
> +++ b/utils/cec-compliance/cec-test-audio.cpp
> @@ -309,6 +309,36 @@ const unsigned arc_subtests_size = ARRAY_SIZE(arc_subtests);
>  
>  /* System Audio Control */
>  
> +/**

Just use /*. This doesn't have to end up in DocBook documentation.

> + * The following scenarios defined in section 13.15 of the HDMI CEC 1.4b
> + * specification are not currently tested:

Which of these tests require three CEC devices? That's a good reason for
not implementing the test. But I think some of these tests can be done if the
CEC adapter is configured as an Audio System, and you test against a TV.

> + *
> + * 1.  Amplifier initiated <System Audio Mode Request> and active source
> + *     discovery with a <Request Active Source> broadcast plus the
> + *     <Active Source> response.
> + * 2.  Post discovery, amplifier subsequent <Set System Audio Mode> [On]
> + *     and System Audio Control feature support confirmation with TV if
> + *     present.
> + * 3.  Amplifier broadcasts <Set System Audio Mode> [On] to mute the TV and
> + *     unmute amplifier.
> + * 4.  Amplifier broadcasts <Set System Audio Mode> [Off] to unmute the TV
> + *     and mute the amplifier.
> + * 5.  When System Audio Mode is On, muting and unmuting an amplifier sends
> + *     a <Report Audio Status> message to the TV.
> + * 6.  When System Audio Mode is On, the amplifier sends a <Set System Audio
> + *     Mode> [Off] to unmute the TV before going into standby.
> + * 7.  When System Audio Mode is On, only the amplifier can control system
> + *     volume.
> + * 8.  Optional features defined in subsection 13.15.4 of the HDMI CEC 1.4b
> + *     specifictation.

typo: specification

> + * 9.  <Request Audio Descriptor> message is new since HDMI CEC 1.4 so 1.3a
> + *     or earlier devices report <Feature Abort> for this feature.
> + * 10. <Report Audio Descriptor> message is new since HDMI CEC 1.4 so 1.3a
> + *     or earlier devices report <Feature Abort> for this feature.
> + * 11. System Audio Control is new since HDMI CEC 1.3a so 1.3 and earlier

1.3 -> 1.3a

> + *     devices report <Feature Abort> for this feature.
> + */
> +
>  static int sac_request_sad_probe(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
>  	struct cec_msg msg = {};
> 

Regards,

	Hans
