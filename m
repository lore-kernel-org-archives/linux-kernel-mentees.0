Return-Path: <SRS0=PDsR=NU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=3.0 tests=BAYES_05,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1E4C432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Aug 2021 12:01:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 860FA60524
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Aug 2021 12:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 860FA60524
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48DDD400A8;
	Sun, 29 Aug 2021 12:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FpHWJ9zQJSyw; Sun, 29 Aug 2021 12:01:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 487DF4017C;
	Sun, 29 Aug 2021 12:01:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3421CC001A;
	Sun, 29 Aug 2021 12:01:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E23FC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Aug 2021 12:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D47940423
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Aug 2021 12:01:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xj0zabXGtoGP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Aug 2021 12:01:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E76E440418
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Aug 2021 12:01:34 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id q70so22175649ybg.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Aug 2021 05:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OySIhzU7j+1i+iyDbRA1iTtjdLiZ5zaizR8jkHw5wJA=;
 b=gvPOmJO1p3xWtcGL2R7agwEKvL6lW9GRoMk6aSNnf4Tejecq6G02nHe1hbO0k/LcwR
 XR6djnpLm5G0Xl503szSEGr9Xcd21m5/+ZO5OsMT43A9pAhp5pR/KzKI5BK9RatEPBYl
 NyuJF7TT6WXb0YRjmpYq4lREwCp/P1NgxqRiVRuo8VQL90f0WVO/NchLj5L1ibZmNLiJ
 Hq4R3j9tEZhjEl4B2AW4HJGCfcmiflzxCblUeGNmX0yHXOuSzMgfw60V12eeaPssugaN
 DYNm6SwbNXLujxH4dRbX9JWJ3EUWJO4zwRIXTGEh22oWgj7ffiH4ArgQAzBzDM6HpKEs
 wU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OySIhzU7j+1i+iyDbRA1iTtjdLiZ5zaizR8jkHw5wJA=;
 b=GvHsUTZDFTHZw8xjTvJqGPiNGcY4JfQKyqEgvcTml+AQGlOUPOemge82QeEHLMhoqI
 O1+p8GXP0ZWKKOQFy+MG+6qSYwVVFPrMKkxz2gTxJuhbwbkQBKuRee46KvvCVkQpHCYF
 KTw7q2kT8ZlqeXdXYF0Ttt565FjF0oLRAQdWqiH5tI8f0IiWkcNh2dFtS9+JhmuG4+3S
 h/jV0J/N50hhKjjonLmHnRO1Uu7+d8tKit0MvC+vbkP9F0Qvl0crMFdIOurHhkRRRKHb
 WweUjBUYiX0k627TqA3FFckVQRL/MlpB9/A15NiZyRrNO0E28IjCkE6C9Ay433+YBqG4
 dwBQ==
X-Gm-Message-State: AOAM531hnEc7O5jkvkMu3YvDg+JidKzAFkQ3U+YkHqkf2NvKCyKhLpH+
 lgrBQphWHLQqdtoDhMeMKflywxHzxB5HPZjckP8=
X-Google-Smtp-Source: ABdhPJz8bWvRJ/6WRK0dvbyj+/xDQY/klvg4iBDEm0xZGXW3r9NlImFVUL1BCOfMgNQ1u3WA0q7oZY2cmic1nbCXgcg=
X-Received: by 2002:a25:d6d8:: with SMTP id
 n207mr16966414ybg.518.1630238493758; 
 Sun, 29 Aug 2021 05:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAKPXbjesQH_k1Z7k4kNwpoAf-jYgbUaPqPCgNTJZ35peVBy_pA@mail.gmail.com>
In-Reply-To: <CAKPXbjesQH_k1Z7k4kNwpoAf-jYgbUaPqPCgNTJZ35peVBy_pA@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 29 Aug 2021 14:01:24 +0200
Message-ID: <CAKXUXMwW62uU8x9WXK7XJ_GQqUyf9Ukz7CNLV5uaxO1S-LMXbA@mail.gmail.com>
Subject: Re:
To: Harshita <hrsa.kshyp@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Sat, Aug 28, 2021 at 4:18 AM Harshita <hrsa.kshyp@gmail.com> wrote:
>
> Hello, I m Harshita.
>
> I am interested in the Checkpatch Documentation mentorship program and I would like to work on the tasks for the mentee selection.
>

Sorry, you were too late and missed the deadline. Please re-apply for
the next period.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
