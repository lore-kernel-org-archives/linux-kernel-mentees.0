Return-Path: <SRS0=tcnQ=HB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664F0C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 30 Jan 2021 12:45:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB11864E0C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 30 Jan 2021 12:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB11864E0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A889C203F8;
	Sat, 30 Jan 2021 12:45:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IyKKWM9eCmu6; Sat, 30 Jan 2021 12:45:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EE00E203B8;
	Sat, 30 Jan 2021 12:45:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DEF0FC0FA7;
	Sat, 30 Jan 2021 12:45:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0EFF1C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Jan 2021 12:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E973E85E95
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Jan 2021 12:45:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RrwA7iu4ZR54
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Jan 2021 12:45:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AA6FD85EC2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Jan 2021 12:45:04 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id e15so8759326qte.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Jan 2021 04:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RXwWSoTjin/rivCZEFNW3zkm4/6/77xIUd9NLbXJWYo=;
 b=FsX6s7qDoTgqywowt4OScYk3lfhtZ/fGsN8vmwhtbVMa5yBF/XgOfgCNqc+H2IBz4O
 BOAnzjesuEK2I0VxpX0nAqQVVPS2nmippOZoAv+3iYORP/2747NkJEACuQ8rG4bG4vbZ
 Mb/XFQW6Yy3/zUR8V8RubXXcT9eUHi4yJrRYQLkE0MBHqYxBGXNL5SpibGBtLzBcRaeG
 yC7bGpIRnSJUvNj79AwQLw8AEZk8dYZ5RoHzxH9OcOGDDY6Zog3lmBesn3Ak9jGnI9PP
 eXI1dqM9zqyQ2wEsD5a7PhpMagc3W00aXVSAMLPlWkqLy/RJU8F7DgtHiHcw01JXQnW8
 Lcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RXwWSoTjin/rivCZEFNW3zkm4/6/77xIUd9NLbXJWYo=;
 b=myMHtVzLbOovKR0SSshN4jYSVcgJPRGybLsK1T7+RjH7A5Zi5RfpT6MARgt/kRDbnY
 6+7TcqHjtgRFFJwrHNwm+f12csiz2QbDo1zCVOUqhrh2bV8jVxBUPQuy7pmidULLgXFK
 AaKlfViY9g7LhiBDj+tAspjXreYmoOSKWTSoTTSPpEHrXh3e0dLm/NsZc0unoaxSEfJj
 0NkolYkv8lHg7Vah3l4gU6VUWFXz5UrJ0NNIG2V5QwXTEydabyMb48T4WPoBS9b/0Fbf
 s6/l0QynUSldWuLW1IOivTJ/rLT6FkDRLjcWs/daR3dAyiXxueOk0Y/M+bxJrPJuujwT
 9IjA==
X-Gm-Message-State: AOAM533Kky41MQrjEpIOrbxu73RIMzlhdT1IRPGoSdJjjJaTWyqo7HQJ
 OFIi7VEHz32tSHlWWp93T88=
X-Google-Smtp-Source: ABdhPJwz2erxFRDcaNzeLiDvh5Q3CpUFUsYYfTWlUGyBj8dFlG4MgXFm0j3vVOWfj6VPE5HrfuRJoQ==
X-Received: by 2002:ac8:6607:: with SMTP id c7mr1595664qtp.341.1612010703790; 
 Sat, 30 Jan 2021 04:45:03 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:9d72:75bc:e42b:f19e?
 ([2804:14d:72b1:8920:9d72:75bc:e42b:f19e])
 by smtp.gmail.com with ESMTPSA id a203sm8651511qkb.31.2021.01.30.04.45.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Jan 2021 04:45:03 -0800 (PST)
To: Hans Verkuil <hverkuil@xs4all.nl>
References: <cfe1c825-bb11-ce78-be60-fedb69ef416f@xs4all.nl>
From: Daniel Almeida <dwlsalmeida@gmail.com>
Message-ID: <69d47520-a2ed-0451-0d66-6192b0b7bc5a@gmail.com>
Date: Sat, 30 Jan 2021 09:44:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <cfe1c825-bb11-ce78-be60-fedb69ef416f@xs4all.nl>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH resend] vidtv: adapter->mdev
	was set too late
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

Hi Hans (sending this again since it also did not make it to the ML..)

 > (resend again, looks like the previous two attempts never reached the ML)
 >
 > Daniel, how did you test the media controller feature? I don't really
 > understand how your merged patch for MC support could ever work. It's
 > the reason I've marked my patch as an RFC since I wonder if something
 > accidentally got messed up along the way.
 >
 > Regards,
 >
 > 	Hans

I still have much to learn on the subsystem.. what I did to test it was 
trying out this command:
media-ctl -d platform:vidtv -p
Media controller API version 5.11.0

Media device information
------------------------
driver          vidtv
model           vidtv
serial
bus info        platform:vidtv
hw revision     0x0
driver version  5.11.0


I was under the impression that this was enough to show everything was 
in order with the patch.

-- Daniel


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
