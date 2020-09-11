Return-Path: <SRS0=DgfW=CU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332EBC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Sep 2020 13:10:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB146224B1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Sep 2020 13:10:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxqVbQBO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB146224B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 423548780D;
	Fri, 11 Sep 2020 13:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uBiYikMDUoVk; Fri, 11 Sep 2020 13:10:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 300158780C;
	Fri, 11 Sep 2020 13:10:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 140F3C0052;
	Fri, 11 Sep 2020 13:10:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6BBEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 13:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 87C6F2052D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 13:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jJ5mJXwHJiD9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 13:10:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 31486204FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 13:10:51 +0000 (UTC)
Received: from coco.lan (ip5f5ad5a5.dynamic.kabel-deutschland.de
 [95.90.213.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 308E022483;
 Fri, 11 Sep 2020 13:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599829850;
 bh=BcM7kvJc/NEQeF2oAWCIqYl2oGSFLPVniYem0zj6ZoE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dxqVbQBOAA5BAwUk+uiTuS5T4u9SVvaBp84K2d9HA2pLUjq1nxHp4qekAc73sSX5U
 UcVBk5OhbonbsxfbW2Vk5mAn60b2lBunRvqJPCVjr+mKgA8yoYQKcmlZOF+no2/tSN
 StyPtdbPhdtuwZslf+NZ5FmG7gMbuyAFAdnFV5k0=
Date: Fri, 11 Sep 2020 15:10:46 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200911151046.076abb79@coco.lan>
In-Reply-To: <25F257A6-C651-4BE7-8482-14FCF121D88F@getmailspring.com>
References: <20200911100200.25214c37@coco.lan>
 <25F257A6-C651-4BE7-8482-14FCF121D88F@getmailspring.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: "r.verdejo@samsung.com" <r.verdejo@samsung.com>,
	"nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"  <skhan@linuxfoundation.org>,  "@lists.linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation,
	"linux-media@vger.kernel.org\"          <linux-media@vger.kernel.org>,  "@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	"org\"" <linux-kernel-mentees@lists.linuxfoundation.org>,
	"linux-kernel@vger.kernel.org\" <linux-kernel@vger.kernel.org>"@osuosl.org
Subject: Re: [Linux-kernel-mentees] [v10 0/4] media: vidtv: Implement a
	virtual DVB driver
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Em Fri, 11 Sep 2020 09:18:20 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> Hey Mauro,
> 
> > Thanks for all the hard work on it. Very much appreciated!
> > 
> > I finally found some time to test it. For now, just a quick
> > test from my side, without passing any arguments to the
> > driver.
> >   
> 
> That's nice!
> 
> > My plan is to write some patches on the top of yours, in order to
> > address the problems I'll find on it. If not something more critical
> > won't be solved in time, we may still add it at staging/media. 
> > Let's see.  
> 
> OK
> 
> > 	3. dvbv5-zap wrote an empty audio file (without -P flag).
> > 	   Probably there are still some issues at the program
> > 	   channel descriptor or service;  
> 
> I don't remember whether I tried this. I tried dumping the stream to a
> file with dvbzap, which should work. By the way, I guess we should be
> comparing the output to this
> 
> $ ffmpeg -f lavfi -i sine=frequency=1000:duration=5 -ac 2 -c:a s302m
> -strict -2 out.ts
> 
> Since it produces a playable transport stream file that actually sounds
> like a sine tone.
> 
> Inspecting ffmpeg & vidtv output side by side in dvbinspector, you'll
> see that they're mostly the same. I have a separate PID for the PCR and
> some other minor differences.

The problem is here:

	$ dvbv5-zap -c dvb_channel.conf "S302m: Sine Wave PCM Audio" -t 30 -o pcm_audio.ts -P
	using demux 'dvb0.demux0'
	reading channels from file 'dvb_channel.conf'
	service has pid type 06:  273

See, it identified the EL type ID as type 6, which is handled by
dvbv5 library here:

		case 0x06: /* private data */
			/*
			* Those can be used by sub-titling, teletext and/or
			* DVB AC-3. So, need to seek for the AC-3 descriptors
			*/
			dvb_desc_find(struct dvb_desc_service, desc, stream, AC_3_descriptor)
				has_ac3 = 1;

			dvb_desc_find(struct dvb_desc_service, desc, stream, enhanced_AC_3_descriptor)
				has_ac3 = 1;

			if (has_ac3) {
				entry->audio_pid = realloc(entry->audio_pid,
							   sizeof(*entry->audio_pid) *
							   (audio_len + 1));
				entry->audio_pid[audio_len] = pid;
				audio_len++;
			} else {
				entry->other_el_pid = realloc(entry->other_el_pid,
							   sizeof(*entry->other_el_pid) *
							   (other_len + 1));
				entry->other_el_pid[other_len].type = stream->type;
				entry->other_el_pid[other_len].pid = pid;
				other_len++;
			}
			break;

Basically, it is not recognizing the stream as an audio PID, but
as some other random data. Due to that, the output of
dvb_channel.conf will be wrong.

As type 6 seems to be the correct one for SMPTE 302M, we need to fix
dvbv5-tools (and likely other tools like kaffeine), in order to
recognize it as audio as well.

> > 	4. The provider service field is null. Perhaps we could
> > 	   add some string there, like "linuxtv.org".
> > 	5. Maybe we could also add a simple NIT table, just to
> > 	   avoid dvbv5-scan to wait for it until timeout.
> > 
> > Also, it probably makes sense to add a debugfs interface in
> > order to allow injecting errors at the stream at runtime.  
> 
> Sure. This is fun, sign me up for it.

Well, if you have some spare time, you could try to write
a debugfs binding for vidtv. The best would be to have it
on a separate file. Failing to bind debugfs should not
prevent loading the bridge driver.

> As I said in a previous email, I think the buffer in vidtv_s302m.c is
> not exactly what we want. It sounds like noise.

Yeah, after changing dvb_channel.conf to:

    [S302m: Sine Wave PCM Audio]
	SERVICE_ID = 2176
	AUDIO_PID = 273
	FREQUENCY = 330000000
	MODULATION = QAM/AUTO
	INVERSION = AUTO
	SYMBOL_RATE = 6940000
	INNER_FEC = AUTO
	DELIVERY_SYSTEM = DVBC/ANNEX_A

   (e. g. changing "PID_06" to "AUDIO_PID")

I was able to record and play it.

Anyway, the actual sound doesn't matter much here, at least for
the first version, as this could be changed later on. 

> I got it from here:
> https://www.daycounter.com/Calculators/Sine-Generator-Calculator.phtml

On a quick look at the s302m_sin_lut table, it is indeed a sinal
waveform, with a DC offset on it (in order to convert it to unsigned),
as "0" is 0x8000. 

The "noise" is actually looks like "humm". This is periodic, it seems. 

> By the way, after some time trying out stuff, I guess this is actually
> what we need in vidtv_s302m_write_frame:
> 
> static u32 vidtv_s302m_write_frame(struct vidtv_encoder *e,
> 				   u16 sample)
> {
> 	u32 nbytes = 0;
> 	struct vidtv_s302m_frame_16 f = {};
> 	struct vidtv_s302m_ctx *ctx = e->ctx;
> 
> 	/* from ffmpeg: see s302enc.c */
> 
> 	u8 vucf = ctx->frame_index == 0 ? 1 : 0;
> 
> 	f.data[0] = reverse[sample & 0xff];
> 	f.data[1] = reverse[(sample & 0xff00) >>  8];
> 	f.data[2] = (vucf << 4)  | (reverse[(sample & 0x0f)] >> 4);
> 	f.data[3] = reverse[(sample & 0x0ff0) >>  4];
> 	f.data[4] = reverse[(sample & 0xf000) >> 12] >> 4;

doing that didn't work. Yet, this check inside the driver:
 
        #ifdef __LITTLE_ENDIAN
        f.data[0] = reverse[f.data[0]];
        f.data[1] = reverse[f.data[1]];
        f.data[2] = reverse[f.data[2]];
        f.data[3] = reverse[f.data[3]];
        f.data[4] = reverse[f.data[4]];
        #endif

Seems plain wrong, as you're already ensuring the endiannes
it is needed when you're doing things like "sample & 0xff".

Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
