Return-Path: <SRS0=f8HV=MS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238B0C4320A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Jul 2021 18:07:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF88F60F90
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Jul 2021 18:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF88F60F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FBE740264;
	Mon, 26 Jul 2021 18:07:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l6xYg4BWmQ2O; Mon, 26 Jul 2021 18:07:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AC807400A9;
	Mon, 26 Jul 2021 18:07:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 856E4C001A;
	Mon, 26 Jul 2021 18:07:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E189FC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 18:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB96A82AF8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 18:07:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1XRKCE9dqAw4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 18:07:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55EB782861
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 18:07:49 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so79405pjm.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 11:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YkBNZMV+7n5H8gA9IlZ5jcPyGMcNQaSbW83IfLj3EX0=;
 b=raW/gHMZLoVMQPXAxV4gHZERbRIGbcoezqGHLALTMBxtp8fXD0jsX2MA7yEswUmmO/
 A7gw9xFTNLYE0UppvokBZ/R2j7CvDpaljoNEB8HApYuTTHViZi0vREgiF21v0EvjuPG/
 9gaWGcE8A1JzpwZwyr3F81ROacQWqiLOu0TGWFQeedFWFxWB9yfaTk0qYXVnmbw1LtRY
 zTr0S7/jRXTlHulV7r+coJfANMGqDd0ySXBnKei/7we68KlPoz1cFRbqFNwdVo76cOUM
 0JckA1HFZE75+3ouZ4FJqcTj/mPR0JA/iSJKhIVLaw8z2VvNTa40fkQBPFx33HYRKkoI
 SfZA==
X-Gm-Message-State: AOAM532tUggmK7uibu5Tz0mg9RQzWJOm6hPBjhub3kpqkil/r2yeao4w
 d0I2M1jMQuLQsevPIMRzLww=
X-Google-Smtp-Source: ABdhPJyquPVeuk0fKONglPfRwZGtA5UjaNmEq/isQ+hwhuQ97ZzUfbz9t4tx9l7tplkg9W15sdpUIQ==
X-Received: by 2002:a05:6a00:aca:b029:392:9c79:3a39 with SMTP id
 c10-20020a056a000acab02903929c793a39mr10103932pfl.57.1627322868624; 
 Mon, 26 Jul 2021 11:07:48 -0700 (PDT)
Received: from garbanzo ([191.96.121.228])
 by smtp.gmail.com with ESMTPSA id c17sm674361pfv.68.2021.07.26.11.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 11:07:46 -0700 (PDT)
Date: Mon, 26 Jul 2021 11:07:44 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Anirudh Rayabharam <mail@anirudhrb.com>
Subject: Re: [PATCH v7 1/2] firmware_loader: use -ETIMEDOUT instead of
 -EAGAIN in fw_load_sysfs_fallback
Message-ID: <20210726180744.crfvxbuyz2bjw2o2@garbanzo>
References: <20210724121134.6364-1-mail@anirudhrb.com>
 <20210724121134.6364-2-mail@anirudhrb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210724121134.6364-2-mail@anirudhrb.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, rafael@kernel.org
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

On Sat, Jul 24, 2021 at 05:41:33PM +0530, Anirudh Rayabharam wrote:
> The only motivation for using -EAGAIN in commit 0542ad88fbdd81bb
> ("firmware loader: Fix _request_firmware_load() return val for fw load
> abort") was to distinguish the error from -ENOMEM, and so there is no
> real reason in keeping it. -EAGAIN is typically used to tell the
> userspace to try something again and in this case re-using the sysfs
> loading interface cannot be retried when a timeout happens, so the
> return value is also bogus.
> 
> -ETIMEDOUT is received when the wait times out and returning that
> is much more telling of what the reason for the failure was. So, just
> propagate that instead of returning -EAGAIN.
> 
> Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>

Acked-by: Luis Chamberlain <mcgrof@kernel.org>

Beautiful.

As you see, without any of this documented in a commit log, the change
would have been very obscure. Now we cleary document a userspace
changing return value clearly.

Thanks!

  Luis
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
