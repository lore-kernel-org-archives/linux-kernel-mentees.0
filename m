Return-Path: <SRS0=2/a+=CV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE964C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 14:49:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72DE020855
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 14:49:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhWSmM+j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72DE020855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1E9E0875C3;
	Sat, 12 Sep 2020 14:49:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id duPpGfmnp+vE; Sat, 12 Sep 2020 14:49:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 855D787224;
	Sat, 12 Sep 2020 14:49:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 715D3C0859;
	Sat, 12 Sep 2020 14:49:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3EC77C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 14:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 269FB87226
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 14:49:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0r1UQ7QPnLE4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 14:49:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4D4AC87224
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 14:49:07 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id 19so10215953qtp.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 07:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding:content-disposition;
 bh=VIl8oc5v5kZHCnLewFAw9Hm4WzGzc8lZoGkyc1yZSGg=;
 b=OhWSmM+j6Ushw+TOLq8Paac0y/kTpOQ57F92Bc24OvDxcz/sX3g5ne3/sjpcJ94kOC
 vas5DOvGZQD3XnPnv7NMv+SrJlSCKq0U7IeWsmoIctiBA35HfZuwzacKg26kGUaRzd+f
 PzuhwcbY6rk+2mQh3h6SN8xAx2Omr4YbsAmCMvCoMMbUjyyYOsRBaD0P4jJ7IzCM/HgB
 j8sTI5DQSddnoxAD64yASNyFE74ZIgJZsGLf5PaN9Tu742ZZzYXu78+F1QlDZ6WqMxI5
 6gA2aC4VbUqH3a2XB/LKsvQWYtkIYo8gIl56pixCC7SoHTcpx6QBzO24gnwz+ySXap7P
 /I/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=VIl8oc5v5kZHCnLewFAw9Hm4WzGzc8lZoGkyc1yZSGg=;
 b=FTfUYc0ECmtMKkdfrspkEW/0fVaUHNMr49leVrmrin+IjHkNqHD+I4yo/fxJnn2tHp
 vDowRGYfHQ5XeaOMhBLA6GW26e433g2XdF1lDKRTjhaRbVMez11Japm9bawhnoMfyPV1
 7uGkUPtZFrDuqhoawSE1tWqSqT+ahBZl9F1eu8VT9+vXD+y7A98QRwsiY54axqPb4r6W
 quRadt7ziiIN2/4Oucam3d18M34711TGCoo9u5/ZgNWginEI4Jn5SBl+Z/p19Y+QDk7s
 PcwoVKjT/L9wyDBe/QU2f45KBhMV/0l8CfLWHx9abXkFiMvS3sA31440t5RU3ywfnC11
 PCNQ==
X-Gm-Message-State: AOAM5304o+tik3SsdHFNcdz9jsd0BjmgyHZoAJbNWIcYfKkZrrvH/r6Z
 sZqXbSUIahwtouKIYFSkUFM=
X-Google-Smtp-Source: ABdhPJwdK6yoyN6rPp1ADzpOBTulPM9j81xXYdaDM9bskGm9V+vOJFWEQJtXIGsQF8OP5SVIVQM4WA==
X-Received: by 2002:ac8:d01:: with SMTP id q1mr6600235qti.276.1599922146141;
 Sat, 12 Sep 2020 07:49:06 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id u55sm7781126qtu.42.2020.09.12.07.49.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 12 Sep 2020 07:49:05 -0700 (PDT)
Date: Sat, 12 Sep 2020 11:49:01 -0300
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <15028D87-A496-4CAD-91A6-E4467489C4D0@getmailspring.com>
In-Reply-To: <20200912111506.2d2bd512@coco.lan>
References: <20200912111506.2d2bd512@coco.lan>
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

Hi Hans and Mauro & all


>Why the dvb_ prefix? All virtual drivers just start with 'vi'.
>
>And wouldn't it make more sense to call dvb_vidtv_bridge.ko just vidtv.ko?
>Just like the other virtual media drivers?

I guess Mauro was the one to come up with the dvb_* prefix for the
kernel modules for the reasons he explicited up in this thread. 

As far as dvb_vidtv_bridge.ko and vidtv_bridge.c, I just wanted to be
verbose so that people would look at this and see that it is the code
for a bridge driver, since this is also supposed to be a template. 

Also because I had some trouble myself figuring out what was what when
first browsing through other dvb drivers. That said, I am 100% onboard
with renaming this to vidtv.ko or whatever seems more appropiate :)


>Yet, I agree with you that at least an alias is needed.
>earlier today, I wrote a patch with such purpose:

If you all would like to just leave this at that ^ I am also ok with it.

>For regression testing of vidtv during the daily build it would be
great if
>the contrib/test/test-media script can be enhanced to include vidtv.

Sure, I can do that if you'd like. Can you provide some tips on how to
get started? :)

>Note that this script relies on the /dev/mediaX devices to run the
tests. I
>noticed that vidtv doesn't appear to create a /dev/mediaX device, even though
>CONFIG_MEDIA_CONTROLLER_DVB=y. This is definitely something that would
be good
>to support in vidtv.

I didn't write any code for this specifically. I was under the
impression that the dvb core would create any/all the necessary files. Mauro?


>I'm thinking on something like:
>
>echo 1 >/sys/kernel/debug/vidtv/discontinuity
>
>to generate a frame numbering discontinuity
>
>and other things like that, changing S/N ratio and other parameters
>and injecting errors, in order to test the effects on user apps.

Can you provide an initial list of things you would like to see? I can
then implement these and we can go from there

When you say 'frame numbering discontinuity', do you mean having a gap
in the the TS continuity counter for a given pid?

For the s302m encoder, maybe we can add some noise to the samples?

> changing S/N ratio

Btw 'lose lock if signal goes bad' code in vidtv_tuner.c and
vidtv_demod.c does not work currently. Mainly because they expect an
array of valid frequencies to compare to and as of now there's no default.

I mean these, just to be clear:

static unsigned int vidtv_valid_dvb_t_freqs[NUM_VALID_TUNER_FREQS];
module_param_array(vidtv_valid_dvb_t_freqs, uint, NULL, 0);
MODULE_PARM_DESC(vidtv_valid_dvb_t_freqs,
  		 "Valid DVB-T frequencies to simulate");

static unsigned int vidtv_valid_dvb_c_freqs[NUM_VALID_TUNER_FREQS];
module_param_array(vidtv_valid_dvb_c_freqs, uint, NULL, 0);
MODULE_PARM_DESC(vidtv_valid_dvb_c_freqs,
		 "Valid DVB-C frequencies to simulate");

static unsigned int vidtv_valid_dvb_s_freqs[NUM_VALID_TUNER_FREQS];
module_param_array(vidtv_valid_dvb_s_freqs, uint, NULL, 0);
MODULE_PARM_DESC(vidtv_valid_dvb_s_freqs,
		 "Valid DVB-C frequencies to simulate");

static unsigned int max_frequency_shift_hz;
module_param(max_frequency_shift_hz, uint, 0);
MODULE_PARM_DESC(max_frequency_shift_hz,
		 "Maximum shift in HZ allowed when tuning in a channel")






> No. I meant the audio was not a sinusoidal wave after such change.

This encoder is dead simple and yet I have been struggling :/

Here is the relevant decoding code in libavcodec/s302m.c:

        for (; buf_size > 4; buf_size -= 5) {
            *o++ = (ff_reverse[buf[1]]        <<  8) |
                    ff_reverse[buf[0]];
            *o++ = (ff_reverse[buf[4] & 0xf0] << 12) |
                   (ff_reverse[buf[3]]        <<  4) |
                   (ff_reverse[buf[2]]        >>  4);
            buf += 5;
        }

I am somewhat confident that the opposite to the above is precisely what
I sent you last:

> f.data[0] = reverse[sample & 0xff];
> f.data[1] = reverse[(sample & 0xff00) >> 8];
> f.data[2] = (vucf << 4) | (reverse[(sample & 0x0f)] >> 4);
> f.data[3] = reverse[(sample & 0x0ff0) >> 4];
> f.data[4] = reverse[(sample & 0xf000) >> 12] >> 4;


Their encoder, which works perfectly of course, is:

libavcodec/s302menc.c:

        for (c = 0; c < frame->nb_samples; c++) {
            uint8_t vucf = s->framing_index == 0 ? 0x10 : 0;

            for (channels = 0; channels < avctx->channels; channels +=
2) {
                o[0] = ff_reverse[ samples[0] & 0xFF];
                o[1] = ff_reverse[(samples[0] & 0xFF00) >>  8];
                o[2] = ff_reverse[(samples[1] & 0x0F)   <<  4] | vucf;
                o[3] = ff_reverse[(samples[1] & 0x0FF0) >>  4];
                o[4] = ff_reverse[(samples[1] & 0xF000) >> 12];
                o += 5;
                samples += 2;

            }

            s->framing_index++;
            if (s->framing_index >= 192)
                s->framing_index = 0;
        }

In which samples[0] and samples[1] are the same for stereo audio.

If you feel like we should only address this later I can drop this
subject but as we've both established, the encoder in v10 is flat out
wrong. Your call :)


-- thanks
-- Daniel

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
