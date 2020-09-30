Return-Path: <SRS0=42xI=DH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18D6C2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 05:27:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D592206B5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 05:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D592206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 98F0486031;
	Wed, 30 Sep 2020 05:27:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BVhHVpXB6Nf3; Wed, 30 Sep 2020 05:27:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2A86485FC9;
	Wed, 30 Sep 2020 05:27:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2102CC0889;
	Wed, 30 Sep 2020 05:27:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B99E5C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 05:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A12FC871B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 05:26:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5LTWqeRLn4YS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 05:26:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9186B871B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 05:26:55 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id z23so889068ejr.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 22:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Je2DNnA/FKfKTqizjipmzNv3owWScP9mvLVXfLsSsn0=;
 b=uCP6SVw8Hy2F2bn0TMwBHnop5t8yUBJxzxKCfvMSrb9bfMR3sTm9qO7CSgbC7/iXUE
 JbPlKcSeHrAM5kT1IAUOHHonfA4EWRAs+QpfNfoicODr9biQIJlJe9zAhnJttn0tloaM
 94taHXR6cDaKNBz5INVi5kIWC63TrnIfHp0hNW564IhNLsQXSztFKezYlbHUjWisU2WA
 zhSABdmqNOUHkPMlO6kOhFr7t9aUhVPPDDnTSod171/vZ6mY9HH+HPDVHng9veBD8hXT
 qmMBh1jbCra0ECKbmkuqlVNc1SgR0jTTb6ebs0zLl0L7/7ZSS577d+QDkW0k+C9E+eYM
 73aQ==
X-Gm-Message-State: AOAM530pKzex+eXLRrP1XnaA5faY2kNUa+CX42y0X2v+jv5cTu6uGEAt
 g4TqOjCNfwsUl0/MhMu6F+E=
X-Google-Smtp-Source: ABdhPJxZWLUkyQs9Cnkhkk/mXboQK+ISYt9QsCL2oAivHTd7YbInKhTXYmmYx659HgrqEpkNaVZF/A==
X-Received: by 2002:a17:906:8559:: with SMTP id
 h25mr1076818ejy.536.1601443614199; 
 Tue, 29 Sep 2020 22:26:54 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id z16sm392636edr.56.2020.09.29.22.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2020 22:26:53 -0700 (PDT)
To: Peilin Ye <yepeilin.cs@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN> <20200925132551.GF438822@phenom.ffwll.local>
 <20200929123420.GA1143575@PWN>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <7d341242-9612-d0ee-4b79-e93882fad73f@kernel.org>
Date: Wed, 30 Sep 2020 07:26:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200929123420.GA1143575@PWN>
Content-Language: en-US
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 0/3] Prevent out-of-bounds access
 for built-in font data buffers
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

On 29. 09. 20, 14:34, Peilin Ye wrote:
> the work in general? I couldn't think of how do we clean up subsystems
> one by one, while keeping a `console_font` in `struct vc_data`.

Hi,

feel free to change struct vc_data's content as you need, of course.
Only the UAPI _definitions_ have to be preserved (like struct console_font).

thanks,
-- 
js
suse labs
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
