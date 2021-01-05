Return-Path: <SRS0=j5Lk=GI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8AFAC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 13:58:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4171722AAB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 13:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4171722AAB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B5D2B20495;
	Tue,  5 Jan 2021 13:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rddhdxa1PJGH; Tue,  5 Jan 2021 13:58:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EC65C20035;
	Tue,  5 Jan 2021 13:58:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C933FC0891;
	Tue,  5 Jan 2021 13:58:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E10DBC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CD47385606
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:58:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v48AzyiEPoFa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:58:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 07160855BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:58:44 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id u21so20793725qtw.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Jan 2021 05:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding:content-disposition;
 bh=YijoxjaSbDn8EkcLYrALCvCV2UwiAYY04Ev049yW7eY=;
 b=S5n6akkvila7jc9wqAP6tQ6a/gfLNiRChMmmxw63M9BNw3vbVS+GTrdPqsoV2LNI5b
 co30O1OJmrJx+bqJIV/+3KTvxMbfUjyQ2ccnQ/2jr2J6Fp6Bvh8UnpKfWsVw0cTcb210
 m3tOEIuDV4kQZHpcCwPHDUxMh/tTwIignVAqydv083y8JJXLQSvG/jVbFrYoaqlGZFIv
 uhwfm8wuM/VZJ31Zrj+ea8RCigcB2pF35BLTphONtsciJ6ZDLfC4mopzAlYJBUJJbqLO
 hgdhgHV/CknXixlu2roynkGqH0y9eYrOB9eLu55S1DjJ+6dZze4qQ1Wrl7x3T2OI5emW
 Uhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=YijoxjaSbDn8EkcLYrALCvCV2UwiAYY04Ev049yW7eY=;
 b=oNaXWmn9IeM4np0wqiJkTeNL/UKLt6fUDlRzZ3VUlIc3ZelixU2hKjApyCqDXJOUBh
 R4kchmXAZhmLWHXb0LEjaASRSR38VioISRhrBJibjvQpPMBy4uxhFuq0SPhoxL4ErCL/
 lP4iu+C9RKzoj+HrylxQoASQAQdIDoBjhW3gI6aNXWnZqZYq3IxPk5ARGmGS1UvhKpwj
 /y7sehutc2QiENU2tt67xwIHj0gRchWloB+TWxkYCsfLrepKNWnMDp8IcdGTJlGE90tz
 uA6w+wkARipf/xmcdhJBS6Rp0EyVLzhkIs7OWLRPF4HuZn6AqwdpS3P4TkstsnyUq2ZP
 VgCA==
X-Gm-Message-State: AOAM533/QrGKFne5DnBlmZVgqY8XfYHT6mqcDC0zxh/TdEUFss8dIznq
 LlsgIzHz/xKqLenyFkHdKSg=
X-Google-Smtp-Source: ABdhPJx+8FLaQ6fCLimi49QJfCUnOmWksFul6+jfgb5WanvesMQJ5yxktHxAZeMJ13UN1xT64ETVCQ==
X-Received: by 2002:ac8:4692:: with SMTP id g18mr76546981qto.255.1609855122983; 
 Tue, 05 Jan 2021 05:58:42 -0800 (PST)
Received: from dwls-dell ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
 by smtp.gmail.com with ESMTPSA id j29sm37907703qtv.11.2021.01.05.05.58.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Jan 2021 05:58:42 -0800 (PST)
Date: Tue, 5 Jan 2021 10:58:35 -0300
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, "=?utf-8?Q?mchehab=40kernel.org?="
 <mchehab@kernel.org>
Message-ID: <DBE23E47-E626-4FF3-8F5A-C009239C7F7F@getmailspring.com>
In-Reply-To: <6cd794fc-90f5-52fe-97d6-69692ec31333@xs4all.nl>
References: <6cd794fc-90f5-52fe-97d6-69692ec31333@xs4all.nl>
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Disposition: inline
Cc: "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?="
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "=?utf-8?Q?linux-media=40vger.kernel.org?=" <linux-media@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] On test-media script integration for
	vidtv
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

Hi Hans & Mauro.

So I sent a few patches today implementing some of what was discussed
here. I added support for modprobe/rmmod, bind/unbind and kmemleak
results at the test-media script by basically adapting the
implementation for vim2m.

The initial compliance test part is missing, of course.

> I'm not a DVB expert, but I was thinking of testing if it can discover
> channels, and perhaps just a test to stream data without checking if
> it is
> actually valid video.
> 
> The problem is that I am not all that familiar with the DVB utilities
> so I
> don't know if anything can be automated.

Mauro, can you chime in on the above please? 

Some of the last changes for vidtv broke some very minor details in the
driver. This meant that some of the tables would not get picked up by
userspace software, even though the driver itself did not crash.

I wonder whether this sort of failure can be picked up in some automated way?

> An alternative is to start adding dtv support to v4l2-compliance. That utility
> already has media controller support, but it needs a bit of work to comfortably
> integrate DTV support as well. I can help with that if you want to go
> in that
> direction. v4l2-compliance would need a bit of refactoring, but it is
> nice to
> have the tests there since that makes it easy to support hybrid
> devices with a
> single compliance utility.

I am still getting acquainted with this tool, but otherwise I am fine
with that.

Also, as let's recap this from a past email from Mauro:

> I suspect that, before that (or together with such tooling), we need
> to properly implement the frontend ioctl, validating the per delivery
> system parameters, as, right now, it just accepts anything from
> userspace. 

Mauro, can you give me some tips on how to get started? I assume there's
some technical documentation detailing what would be considered valid
values for the different delivery systems in use today? 

Also, where should I add the checks? Is it at
"vidtv_demod_set_frontend()" ?

-- Daniel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
