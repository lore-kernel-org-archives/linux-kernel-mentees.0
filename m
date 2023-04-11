Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25733C77B70
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Apr 2023 04:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86F6C417B6;
	Tue, 11 Apr 2023 04:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86F6C417B6
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CJxFkB6T
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jldPOGPq8Q3F; Tue, 11 Apr 2023 04:51:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0CBA340AB9;
	Tue, 11 Apr 2023 04:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CBA340AB9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF9B2C0037;
	Tue, 11 Apr 2023 04:51:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFBA3C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Apr 2023 04:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75CA881985
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Apr 2023 04:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75CA881985
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CJxFkB6T
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TyZ64CueR0Qk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Apr 2023 04:51:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F6D881926
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F6D881926
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Apr 2023 04:51:22 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id w11so7342618pjh.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Apr 2023 21:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681188681; x=1683780681;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=z6UPiY38yO+I9miVlmKFqc6AE+fAemcc/uHi48eGyh4=;
 b=CJxFkB6TktKzxhxys6lPO/FkaVIgnHSsYFE9+zgHTlzuUP24E//COr3OOQlBgt30MN
 2NVoom6bGQKHywKKkcBroElCPe48rUqh+B26XRMNYsWGFkcltik5HV1iaPNlwjdR+OyV
 UcJN/2yj0XlurG9DGc/HxruAoK9wvZMJTPOXJnVE7Mjr8zDRlD2Zj72PlLDPtjiiry9E
 S1sxw7a94CNC+JI/1I7j8AiKDV1NkR6wdpLC9nJqy9QOdhgVHiYZ+VMUJZVVbTMWbdoU
 CnO0AviStyNjKDfBsjDvl8UqqKJ6x/wWAplxwmkHyR5uO2WylV3a9oMs9ihhKkN84KgD
 U9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681188681; x=1683780681;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z6UPiY38yO+I9miVlmKFqc6AE+fAemcc/uHi48eGyh4=;
 b=4QvTl8Xfz56x9T+iQHsnqBGxKqtWf+xbF//ftnIQjr0tLnyfg+hO3AKaXY6InjnT6O
 HyR+ZH0AwQXS4FHgnf9UQB0B9KIk1woDKnN15MTPBZxXnuA6Yec/OeOGN/D1mhprcOuZ
 u6Y9vxyeJgBBDhBaDvxQhBEXtdabFrhK4bm7IF3L2PL+CEO+lL/DGLQRYV1KHCVrSpQG
 tTmXxmE+yVyJbFbXswK9Trvt9kfuh7QB4cJDFbLEVosxWvFHs2qDBf5ywxLMqSZqB1vx
 RWh6WMJWzITWYIcnnYNBQ4YrZyWTx3Up4QeJ5EeexSVhCXcIo3I0pqMsHCNNF31lgJkP
 bemA==
X-Gm-Message-State: AAQBX9eo7T9GTpjjKV0CKKCUdNPBYo1I2wLHpUhdWP9UNW8sIoWR2RjA
 wYeRGuUKgRZ/kGS3Fi4I7t38+v10wwI=
X-Google-Smtp-Source: AKy350a7JKPF9ZSzKHiX/FAlJYHxvz/Eewu9Mxyr1Jcm2ggFe4eA8XUZwgqFHmgU20yu7YwBmn/LvA==
X-Received: by 2002:a17:902:e5d1:b0:19d:1d32:fc7 with SMTP id
 u17-20020a170902e5d100b0019d1d320fc7mr1530263plf.51.1681188681416; 
 Mon, 10 Apr 2023 21:51:21 -0700 (PDT)
Received: from atom0118 ([2401:4900:1c0f:b9e0:3218:620d:6456:d093])
 by smtp.gmail.com with ESMTPSA id
 ji10-20020a170903324a00b0019a83f2c99bsm3830696plb.28.2023.04.10.21.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 21:51:20 -0700 (PDT)
Date: Tue, 11 Apr 2023 10:21:15 +0530
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] selftests: Improves rtctest error handling.
Message-ID: <20230411045115.GA5979@atom0118>
References: <20230408074059.397065-1-atulpant.linux@gmail.com>
 <20230408115015bcc4b5ba@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230408115015bcc4b5ba@mail.local>
Cc: a.zummo@towertech.it, shuah@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Sat, Apr 08, 2023 at 01:50:15PM +0200, Alexandre Belloni wrote:
> On 08/04/2023 13:10:59+0530, Atul Kumar Pant wrote:
> > When running the rtctest without root privileges the test fails
> > expectedly, but prints the logs that are not useful to point to the issue.
> > Similarly, if we pass wrong rtc device file as an argument, the test
> > output failure logs do not point to the issue that the rtc file is
> > invalid.
> > To handle these issues, this patch adds checks to verify uid with which
> > the test is run and also if the rtc_file is valid.
> > 
> > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > ---
> >  tools/testing/selftests/rtc/rtctest.c | 34 +++++++++++++++++++--------
> >  1 file changed, 24 insertions(+), 10 deletions(-)
> > 
> 
> Please run your patch through checkpatch.pl, the indentation and comment
> style are not correct.

Sure I'll fix this is next patch.

> 
> > diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
> > index 2b9d929a24ed..9564346c63eb 100644
> > --- a/tools/testing/selftests/rtc/rtctest.c
> > +++ b/tools/testing/selftests/rtc/rtctest.c
> > @@ -388,16 +388,30 @@ __constructor_order_last(void)
> >  
> >  int main(int argc, char **argv)
> >  {
> > -	switch (argc) {
> > -	case 2:
> > -		rtc_file = argv[1];
> > -		/* FALLTHROUGH */
> > -	case 1:
> > -		break;
> > -	default:
> > -		fprintf(stderr, "usage: %s [rtcdev]\n", argv[0]);
> > -		return 1;
> > +    int ret = -1;
> > +
> > +    // Verify if the test is run as root
> > +    if (getuid() != 0) {
> > +		ksft_exit_skip("[ERROR]: Please run the test as root - Exiting.\n");
> 
> If this is an error, should we really return skip? This may end up being
> silently ignored whereas the expectation is to test the rtc.
> 

Yes, we should not skip the test. In that case we can use 'ksft_exit_fail_msg'.
I'll fix this in next patch.

> Also, you may use the rtc as non root so I guess the access() test
> should be enough.

I added this check for the use case when we use the rtc file from /dev/ which will require root
permissions. Should I keep this check ?

> 
> > +    }
> > +
> > +    switch (argc) {
> > +    case 2:
> > +        rtc_file = argv[1];
> > +        /* FALLTHROUGH */
> > +    case 1:
> > +        break;
> > +    default:
> > +        fprintf(stderr, "usage: %s [rtcdev]\n", argv[0]);
> > +        return 1;
> >  	}
> >  
> > -	return test_harness_run(argc, argv);
> > +    // Run the test if rtc_file is valid
> > +    if (access(rtc_file, F_OK) == 0) {
> > +	    ret = test_harness_run(argc, argv);
> > +    } else {
> > +		ksft_exit_skip("[ERROR]: %s : File does not exists - Exiting\n", rtc_file);
> 
> 
> > +    }
> > +
> > +    return ret;
> >  }
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
