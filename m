Return-Path: <SRS0=nBzY=EP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A5CC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 11:54:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 447F4206ED
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 11:54:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mv1Xg4hu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 447F4206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7DA948705D;
	Mon,  9 Nov 2020 11:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LWulDQdGAmqG; Mon,  9 Nov 2020 11:54:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A8E988700A;
	Mon,  9 Nov 2020 11:54:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9BE72C0889;
	Mon,  9 Nov 2020 11:54:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48143C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 11:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1C9FA204D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 11:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T8Iqd3wDPZZ9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 11:54:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by silver.osuosl.org (Postfix) with ESMTPS id 8472B20028
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 11:54:30 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id ec16so3862400qvb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Nov 2020 03:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=oH24vQ77nKmAQfj5En9OTOQy8UKIFEqTn+IPbckNbN8=;
 b=Mv1Xg4huiZou0vFwiCzqS7cPQV5ipJEJs3vAxL/ur71AAVHw2ItgQnVsH55YcDrN5Z
 dpzCwSWTvz0Q8sB2XGWgcI9/6vVDYL5iNmfLvGkxZ24a2n00qr9mKmqE82gl+bhZU/7l
 dGaGr0hFa3ghOaeUlxgnQeynl4R8/DSfEd39MafdJv57rE9EJrQjmcSaGz/mUf9cjsti
 imUCUyw6Fg2Ahxafwb8FwxNl3f7s5+a8eXWXF1HTtv2uNaIrN6uv8QOqmQZlXpSIMlNy
 eH4iooevw2NBqZsSQ+j2JcYxgqd5hBxv0/QTVPJiQ1gZSveZ9oSFRJxNr84BRZ1Nxa32
 zdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=oH24vQ77nKmAQfj5En9OTOQy8UKIFEqTn+IPbckNbN8=;
 b=btTnxrV852EJY6TXrsG4FjTL82xOORzBVvf+EHXTEjl0e3m/fLdN/zyPxknu6P8gXK
 /O9gVuWagzeCMnHoYeid+PJVVA7SbAZJmLvRB++oStiEN3O5oOQPLQ96sR6rbUrre+X1
 1dfeAOyzsSABjI+dKiiNkuL59WBGnn0pPEC0pMUkj46a1ujvNSNVgilrPcYSyZ2T7mo+
 khOahf284yuC7XRcsE2eELd0nIk3LTq7Y2qesDb+HnMer6tWFLEe0fbEz0PextoQbYhL
 NmcEU9+hMukC08NRJRJBBN8KOFbqhc4JhfNyNMcFvCkh78I6pgj0qH2rR6FBWYeEn89h
 UcIg==
X-Gm-Message-State: AOAM533BqDSqXNxwsKA/tlmQMHNQVRaQjB8Spmoj+ywB62LU2Kzoqj8y
 9j8pc8d0zIWgEGi8qkMNnRewGHkO4l4CwQ==
X-Google-Smtp-Source: ABdhPJzU1mrn9kEMxgcLgBcJdVrbTZruhHzreOhdAOSm001f/TJCyFdz01+9ne7tr78sHMwqmrrA2A==
X-Received: by 2002:ad4:5888:: with SMTP id dz8mr2298242qvb.34.1604922869162; 
 Mon, 09 Nov 2020 03:54:29 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac?
 ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id z134sm6102351qka.21.2020.11.09.03.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 03:54:28 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, hverkuil@xs4all.nl
Message-ID: <838fdbcc-87b1-a40a-ebd3-59fce07f2d51@gmail.com>
Date: Mon, 9 Nov 2020 08:54:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] On test-media script integration for vidtv
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Hans & Mauro.

Well I now have some more time to work on vidtv so I'd like to start off 
with the test-media script integration as mentioned by Hans some time ago.

Let's recap:



> For regression testing of vidtv during the daily build it would be great if
> the contrib/test/test-media script can be enhanced to include vidtv.
> 
> This is run during the daily build with a kernel that has lockdep and many
> other checks enabled, so it is very helpful to verify that no regressions
> happened.
> 
> Note that this script relies on the /dev/mediaX devices to run the tests. I
> noticed that vidtv doesn't appear to create a /dev/mediaX device, even though
> CONFIG_MEDIA_CONTROLLER_DVB=y. This is definitely something that would be good
> to support in vidtv.
> 
> Regards,
> 
> Hans


So I have been looking at the documentation for a bit, i.e.

> https://www.kernel.org/doc/html/v4.14/media/uapi/mediactl/media-controller-intro.html

What I understood from that is that entities and interfaces under 
/dev/media/ are created to model actual hardware, but vidtv is a virtual 
driver. Can this be clarified?

Is this separate from the files created by the dvb core as part of the 
driver initialization?
e.g. (for a single adapter):

/dev/adapter0/frontend0
/dev/adapter0/demux0
/dev/adapter0/dvr0

Btw I noticed some drivers call dvb_create_media_graph() as part of 
their initialization, e.g. au0828-dvb.c, em28xx-dvb.c, cx231xx-dvb.c, 
but some (most) do not, why is this?


> Daniel, if you look at the test-media script, then you'll see that it has
> separate sections for each virtual driver. It's probably best to look at
> the vim2m driver tests since that's the easiest.
> 
> It loads the module, then it starts v4l2-compliance to test the API. This
> utility basically tries all V4L2 APIs and checks that the driver conforms to
> the spec.
> 
> Note that you see options like '-m platform:vim2m' that selects which /dev/media
> device to use based on the name and v4l2-compliance (or v4l2-ctl with the -z option)
> then walks the topology of the media device and tests all interfaces it finds.
> 
> Hence my question about media controller support in vidtv: this should be
> supported there as well since it allows you to write these test sequences without
> having to know which /dev/fooX device should be used.
> 
> After the compliance test is run the script tests unbind/bind (always a nasty test)
> and checks for memory leaks (if enabled in the kernel).
> 
> Much of this test sequence can be copied for vidtv, but you need something else for
> the compliance test. It would for now be enough to have some quick check with the
> existing dvb utils from v4l-utils to see that the basics work.
> 
> IMHO I think a dtv-compliance utility along the lines of v4l2-compliance and
> cec-compliance should be created.
> 
> I'm actually wondering whether the dtv compliance tests shouldn't be part of
> v4l2-compliance (which would have to be renamed to media-compliance in that case)
> since there are hybrid drivers supporting both in the same media topology.
> 
> This would make compliance tests possible where analog/digital TV mode handling
> is tested (i.e. if analog TV is in use, then trying to use digital TV would return
> EBUSY and vice versa).
> 
> It would require some work in v4l2-compliance.cpp to make this possible, but I
> can do that myself.
> 
> Compliance tests have proven to be a great method of testing for regressions and
> testing drivers in general.
> 
> Note that it takes a lot of time to create good compliance tests, but you just start
> with some simple tests and expand it over time.
> 
> Regards,
> 
> Hans


Well, I checked the test-media script and it seems to be easy to add 
support for vidtv there, as Hans said most of the sequence there can be 
copied from the other drivers. However..

 >It would for now be enough to have some quick check with the existing 
dvb utils from v4l-utils to see that the basics work.

Can we discuss this in further depth please? Maybe a few examples?

What I currently do is:

1. zap the stream & open it in dvbinspector, manually check for mistakes
2. manually check dmesg for errors
3. maybe play the stream using vlc or Kaffeine

-- thanks
-- Daniel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
