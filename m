Return-Path: <SRS0=DgfW=CU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AACDC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Sep 2020 12:18:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0710E221F1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Sep 2020 12:18:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUSXE6G6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0710E221F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8A80086A4F;
	Fri, 11 Sep 2020 12:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4tlr9RvLbqgx; Fri, 11 Sep 2020 12:18:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E408986A4D;
	Fri, 11 Sep 2020 12:18:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2D83C0052;
	Fri, 11 Sep 2020 12:18:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 976A2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 12:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 86DEC86880
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 12:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vka6Ok1sTsNN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 12:18:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A0A19853D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 12:18:26 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id 19so7643745qtp.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 05:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding:content-disposition;
 bh=Cs/iobQYRqaFzLTEbvzarWAtlZcWcdH6WTrzD1iXXms=;
 b=IUSXE6G6aAvVETAfO/9wzVtAQbhmuaBANbZW856L+9qmoQGKQRJyQxoWowvBm4MdCU
 QsOiF2fwjEOKvOOpl+RiGRXx568y2k33MMaYgyAr37FN5R3p0YT21HaSF8WkUjZ6j8zw
 i7O0qUMzZhydCtO3XDbAbRNdN3deIogsj5+CyAVD8305408T52Z4OxGzKAGuPBIZYSaU
 RgL1gOXI9ZcKdMkX0GfjDVW3BTEHr1kwovGWs77Z1WziipDTnbM7o6ygaMI7ybQusCQS
 VVRobQWt6z5GMdnKXUhikh8Cg+dLNRACf4q88Aqh29j5tqYz0BB2GnxPjNUiCx7q73yD
 Rd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=Cs/iobQYRqaFzLTEbvzarWAtlZcWcdH6WTrzD1iXXms=;
 b=dGnCUzyKhsLZ5VcQ6Gp5iKb5KvjADSABBroKh2FwrrRZpyHhQceU1idJQz+cI4ylb6
 WHflG54wGTY4fG/w3yeDn7MjijrXn0CAGPYHTsY6/YI1o91vHcp+UJu2U1ZlDUyMYR7Y
 E9hWEGeyBb8NjIW1X/O34Wg73Ppx21itQu+Ih5zDY/SPqyiDy9iSmj2uEoMWqpUiu2AV
 pYhUMlZRCkyG1lkCmmec727MHIMIIyEGdB1je4DP+SFXMxWS6b423WoIkCI9tf3FJliP
 Gd5VIHxOXzx2r1xhkzaCTKj8DYOUHvuNULU9vr1Vglqzcpl4SQGm8a9+U2aGsRFZoaxE
 Digw==
X-Gm-Message-State: AOAM531YqHVbe3UerC8IZOJ5gAh49vZcKjpI4igirT3bIfZzouzC/iZa
 PdnQ3+anH4ngIsRdNWDEPeU=
X-Google-Smtp-Source: ABdhPJx1zaU8fB7FYIimQwDiXZm3pN0k86OKVpf8m5ton+2GLUPtSwQJ7gLWULRv1XFPbncBR3VlFA==
X-Received: by 2002:ac8:3933:: with SMTP id s48mr1524081qtb.294.1599826705565; 
 Fri, 11 Sep 2020 05:18:25 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id r42sm2444052qtk.29.2020.09.11.05.18.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Sep 2020 05:18:25 -0700 (PDT)
Date: Fri, 11 Sep 2020 09:18:20 -0300
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <25F257A6-C651-4BE7-8482-14FCF121D88F@getmailspring.com>
In-Reply-To: <20200911100200.25214c37@coco.lan>
References: <20200911100200.25214c37@coco.lan>
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Disposition: inline
Cc: "=?utf-8?Q?r.verdejo=40samsung.com?=" <r.verdejo@samsung.com>,
 "=?utf-8?Q?linux-kernel=40vger.kernel.org?="
 <linux-kernel@vger.kernel.org>,
 "=?utf-8?Q?nicolas=40ndufresne.ca?=" <nicolas@ndufresne.ca>,
 "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?="
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "=?utf-8?Q?linux-media=40vger.kernel.org?=" <linux-media@vger.kernel.org>
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

Hey Mauro,

> Thanks for all the hard work on it. Very much appreciated!
> 
> I finally found some time to test it. For now, just a quick
> test from my side, without passing any arguments to the
> driver.
> 

That's nice!

> My plan is to write some patches on the top of yours, in order to
> address the problems I'll find on it. If not something more critical
> won't be solved in time, we may still add it at staging/media. 
> Let's see.

OK

> 	3. dvbv5-zap wrote an empty audio file (without -P flag).
> 	   Probably there are still some issues at the program
> 	   channel descriptor or service;

I don't remember whether I tried this. I tried dumping the stream to a
file with dvbzap, which should work. By the way, I guess we should be
comparing the output to this

$ ffmpeg -f lavfi -i sine=frequency=1000:duration=5 -ac 2 -c:a s302m
-strict -2 out.ts

Since it produces a playable transport stream file that actually sounds
like a sine tone.

Inspecting ffmpeg & vidtv output side by side in dvbinspector, you'll
see that they're mostly the same. I have a separate PID for the PCR and
some other minor differences.



> 	4. The provider service field is null. Perhaps we could
> 	   add some string there, like "linuxtv.org".
> 	5. Maybe we could also add a simple NIT table, just to
> 	   avoid dvbv5-scan to wait for it until timeout.
> 
> Also, it probably makes sense to add a debugfs interface in
> order to allow injecting errors at the stream at runtime.

Sure. This is fun, sign me up for it.



As I said in a previous email, I think the buffer in vidtv_s302m.c is
not exactly what we want. It sounds like noise.

I got it from here:
https://www.daycounter.com/Calculators/Sine-Generator-Calculator.phtml

I will just copy what I had in a previous email here:

>How do I compute the values for a sine wave such that it can be played indefinitely?
>
>I was thinking about this: (just spitballing here..)
>
>sampling_rate_khz = 48000
>buffer_size = sampling_rate_khz * seconds
>i = 0
>
>for i < buffer_size:
>buffer[i] = 32767 * sin( 2 * PI * freq / (sampling_rate_khz * i) )
>
>
>but rather I want to precompute a single period for a given frequency
>such that I can loop on the array indefinitely



By the way, after some time trying out stuff, I guess this is actually
what we need in vidtv_s302m_write_frame:

static u32 vidtv_s302m_write_frame(struct vidtv_encoder *e,
				   u16 sample)
{
	u32 nbytes = 0;
	struct vidtv_s302m_frame_16 f = {};
	struct vidtv_s302m_ctx *ctx = e->ctx;

	/* from ffmpeg: see s302enc.c */

	u8 vucf = ctx->frame_index == 0 ? 1 : 0;

	f.data[0] = reverse[sample & 0xff];
	f.data[1] = reverse[(sample & 0xff00) >>  8];
	f.data[2] = (vucf << 4)  | (reverse[(sample & 0x0f)] >> 4);
	f.data[3] = reverse[(sample & 0x0ff0) >>  4];
	f.data[4] = reverse[(sample & 0xf000) >> 12] >> 4;

	nbytes += vidtv_memcpy(e->encoder_buf,
			       e->encoder_buf_offset,
			       VIDTV_S302M_BUF_SZ,
			       &f,
			       sizeof(f));

	e->encoder_buf_offset += nbytes;

	ctx->frame_index++;
	if (ctx->frame_index >= S302M_BLOCK_SZ)
		ctx->frame_index = 0;

	return nbytes;
}


i.e. see: https://docplayer.net/37828038-For-television-mapping-of-aes3-data-into-an-mpeg-2-transport-stream.html
Figure 5, page 4.




Lastly, I am somewhat new to C, so a few things might look odd here and
there. If you come across something that's too verbose tell me and I
will try to tidy it up.


--thanks
-- Daniel


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
