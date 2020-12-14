Return-Path: <SRS0=WLyE=FS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC84C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Dec 2020 05:45:54 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E190229C7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Dec 2020 05:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E190229C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E57E020455;
	Mon, 14 Dec 2020 05:45:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KspOYYa8DMwI; Mon, 14 Dec 2020 05:45:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 498F820444;
	Mon, 14 Dec 2020 05:45:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 406C1C088E;
	Mon, 14 Dec 2020 05:45:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C13AEC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 05:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A8A9F20455
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 05:45:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FpU1ET0VVlVR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 05:45:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by silver.osuosl.org (Postfix) with ESMTPS id AB42620444
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 05:45:50 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id i18so15769316ioa.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 21:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P+jnz7d6nrvbfqnOxBHQwbDVZ2dQ3VhrAc3PJPSIZJM=;
 b=nJYKx+Z3oRV4qyn/bhX9Ye8j08ZByXw7uCVjptoCNBJ86RIEOUeFfh6LXuBDux9Avc
 gFdg9jvSiBKgdA7uFi8PT815cu8Kbe9RZy8Gd7hL59o0TlJGwtv18/Nwa/0fGZFvxQ6y
 97F62zDsk/kPN+sGDD8qrEr0mq0gMYqD7fjkVV5Oqwtjera0UyhmnjGK0iw5sJxUIhzW
 qOZtds3gKvVxHfDRnSTqbq2oiXdIZzTMvm4n9gtHVe0Wdz3Geph3x7UIEN59UO7SAlYn
 G8TJWW5oC5VnJQ/paiYbDbXf2IEl/7tWwmqX1dQR+Yj2SYIfWan/IHQe6Wv64UKc5qsc
 7AHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P+jnz7d6nrvbfqnOxBHQwbDVZ2dQ3VhrAc3PJPSIZJM=;
 b=Two60caFqr99zfQWXgC2i9IdvIC5uWawtKN7lwwgGNkbvDjB9pxWU0/gLMxUQVbjKy
 6Qd9ZVkP98tViEn19+i3u9HUzP/rTrQkHUzI25oQ9LIUy63o9IzHoH2OaKtsY5ys4onB
 8ag3KMK4oKh2BDfJmDRA6kdyvgIg6jbKStZnAH/d58SqYp71vDxqe5Dr2reFwmJw/oG5
 T73stT7aZKeW+yz4uOUToiIfPEssgmcGwILyyuHQbFIJNd6QtHp9saGeUHFBoh0+bLnG
 CR743LZVhvahKfWoUwG7QZixRrq6r/bwH7Mk54eQedRanUPtsAIi9hw0N97pEr3jTr2C
 4gIQ==
X-Gm-Message-State: AOAM530iQhIyC0shHen5sufGIISRMlge9nywcgg8YZfXhPOjgI9rlW/u
 ofau5TP1vRu+uIK2yh1f1kNrX4VK9VV2TsprLoo=
X-Google-Smtp-Source: ABdhPJxjc45+n/HWtzd2C3gIDbIMz0V5JdMPTQst7vBsnSy95LXiujP3m8SKkKoodzrNe9XBy1ExNgHEJFP7hGbUj1c=
X-Received: by 2002:a5e:9906:: with SMTP id t6mr30041212ioj.183.1607924749947; 
 Sun, 13 Dec 2020 21:45:49 -0800 (PST)
MIME-Version: 1.0
References: <20201213172136.15975-1-yashsri421@gmail.com>
 <5579438a-da78-3589-923e-c7eb174412c5@gmail.com>
 <CAKXUXMym5OFos4y92T8wbNEGM3ttGt+vt7-KrHD1K1R8q6izOA@mail.gmail.com>
In-Reply-To: <CAKXUXMym5OFos4y92T8wbNEGM3ttGt+vt7-KrHD1K1R8q6izOA@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 14 Dec 2020 06:45:39 +0100
Message-ID: <CAKXUXMz2Xmg4a+SEUAtAcHz+D39HQ1LSgOZnPc0MVfKLFzCqEg@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] media: atomisp: replace boolean
 comparison of values with bool variables
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

>
> Other than that, the change looks good. It is probably a driver that
> is on its way to removal anyway. So, do not be surprised if even if
> the maintainers thinks the change generally improves the code, they
> simply do not want to touch code that is soon to be deleted.
>

Here is some reading material on staging:

https://lwn.net/Articles/798258/
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
