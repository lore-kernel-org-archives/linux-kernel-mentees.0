Return-Path: <SRS0=tcnQ=HB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7205C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 30 Jan 2021 12:36:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A95664DDC
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 30 Jan 2021 12:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A95664DDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DFB9686B06;
	Sat, 30 Jan 2021 12:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s424BAx79pSw; Sat, 30 Jan 2021 12:36:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CD07C86AFF;
	Sat, 30 Jan 2021 12:36:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B131BC0FA7;
	Sat, 30 Jan 2021 12:36:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 558B8C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Jan 2021 12:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1A04120112
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Jan 2021 12:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pRzBi5NXeI21
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Jan 2021 12:36:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by silver.osuosl.org (Postfix) with ESMTPS id 10D0D2010A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Jan 2021 12:36:10 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id n7so11510729qkc.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Jan 2021 04:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=4AhkauCxhTK4aXQ6uQz0IUsq29eoXNJhb0MQlmp7OIM=;
 b=XG6oug6NSPHkVtdjH7XSCQpaKGd1ecoanylIOkgcwPvf0qnhVhy1ZX5CCPVUTdj6SW
 AvV9wEsvMcI0y2W9oZmHSR0OLm1iJHJOSv9Tgm8xkMMZg1wH6llaDowCCjAj2Ps65nwj
 Uu13IPoxXGg5Cz6KFoQjODh3gMAOZR6gG2aoVrSziz1IxvhrZJHf9+QMh2kMnXyE6DKX
 GYY6lSfNePYgPl6kwAyDFBAyDh1aQvYflQXrgxggjSdKlDsok8ON3JGFSeRHam+Tj1gF
 hBZUnQbNZH5TMOisLGUAqQlBe0ad2X6e7U3h/G/hFPd6mMVodGaTYnQsAXEi7vTZ8Ccm
 iO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=4AhkauCxhTK4aXQ6uQz0IUsq29eoXNJhb0MQlmp7OIM=;
 b=WreXvWCrN2BiG66e1m9jY0PC+SJ44z+/ny0UcLaflY4bvs0v6QuksbDqPaNrMMmAyp
 gOe21u3bYUlzvLmqR5jvE6tLqRtYcVddUcDtb4425QIrh5Y6x2i4J1sw2s+r0vvUuXoU
 JNqjXeupPOVv0NKv97eVJqUVxk9hinRDmgWlsEPISekl6fuvm7Ikw42RjwiCxQ66LtHb
 Tvmnktso+bUrOtB5xlndRzVzOPpGe36Ex1P/uQnw8u97jnPmzbzGZAIMa6OgDrdhf0ND
 MA0vZFcgQ7INXOPjFUZevKhtxcIfKSHZHxyEX0k6UsTtpteSHacZ6by0pcrQ4smDDPzA
 WvXw==
X-Gm-Message-State: AOAM531rVQ4hsxGi8xYVZPfhvSsnKwPzZ4+eDYyjjnPTcpcc7v8O/id/
 lcTQhqIYuOlQ44CSzaYnnnc=
X-Google-Smtp-Source: ABdhPJyYN8m/IlvIKFlzPiPptrKLiN2LoiVGN7ak+hBaSTQ+8trGpsqooc743LpHKaIvzE5nRJhkHQ==
X-Received: by 2002:a37:65d3:: with SMTP id z202mr8210709qkb.118.1612010169023; 
 Sat, 30 Jan 2021 04:36:09 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:9d72:75bc:e42b:f19e?
 ([2804:14d:72b1:8920:9d72:75bc:e42b:f19e])
 by smtp.gmail.com with ESMTPSA id p12sm8456282qtw.27.2021.01.30.04.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Jan 2021 04:36:08 -0800 (PST)
To: Hans Verkuil <hverkuil@xs4all.nl>
References: <bb8ae9fe-a03f-9fbb-f8ad-6c24f8cbad86@xs4all.nl>
From: Daniel Almeida <dwlsalmeida@gmail.com>
Message-ID: <64ab8e8b-ff40-8c95-ba62-55d8c59c31c7@gmail.com>
Date: Sat, 30 Jan 2021 09:36:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <bb8ae9fe-a03f-9fbb-f8ad-6c24f8cbad86@xs4all.nl>
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
Content-Type: multipart/mixed; boundary="===============8778550429103632052=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This is a multi-part message in MIME format.
--===============8778550429103632052==
Content-Type: multipart/alternative;
 boundary="------------702B9753D906C7685E9B3038"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------702B9753D906C7685E9B3038
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Hans

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
driver          vidtv
model           vidtv
serial
bus info        platform:vidtv
hw revision     0x0
driver version  5.11.0


I was under the impression that this was enough to show everything was 
in order with the patch.

-- Daniel



--------------702B9753D906C7685E9B3038
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Hans</p>
    <p>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">(resend again, looks like the previous two attempts never reached the ML)

Daniel, how did you test the media controller feature? I don't really
understand how your merged patch for MC support could ever work. It's
the reason I've marked my patch as an RFC since I wonder if something
accidentally got messed up along the way.

Regards,

	Hans</pre>
      </blockquote>
      <br>
    </p>
    <p>I still have much to learn on the subsystem.. what I did to test
      it was trying out this command:</p>
    media-ctl -d platform:vidtv -p <br>
    Media controller API version 5.11.0<br>
    <br>
    Media device information<br>
    ------------------------<br>
    driver          vidtv<br>
    model           vidtv<br>
    serial          <br>
    bus info        platform:vidtv<br>
    hw revision     0x0<br>
    driver version  5.11.0<br>
    <p><br>
    </p>
    <p>I was under the impression that this was enough to show
      everything was in order with the patch.<br>
    </p>
    <p><span style="color: #b3b1ad;">-- Daniel<br>
      </span></p>
    <br>
  </body>
</html>

--------------702B9753D906C7685E9B3038--

--===============8778550429103632052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8778550429103632052==--
