Return-Path: <SRS0=R4Bt=FA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4D3C56202
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Nov 2020 10:06:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAAD02145D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Nov 2020 10:06:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4RPpiHk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAAD02145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 45E2787117;
	Thu, 26 Nov 2020 10:06:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TRuklmVZNcm3; Thu, 26 Nov 2020 10:06:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C4ABE86D52;
	Thu, 26 Nov 2020 10:06:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFE0FC163C;
	Thu, 26 Nov 2020 10:06:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DDB4C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 10:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6739C87290
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 10:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id COp7aIiRM_Jg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 10:06:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A4CF087287
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 10:06:04 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id f17so1318203pge.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 02:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=n8JGdBXj1nnf7gYy/LjTC9Yo5X3dAPPW+DajEprvTRY=;
 b=C4RPpiHkvUUmxPVHmKtf0pt7RxQi/1vw+nJcl5I0TLQSfJKkdjIfqxQ7zzdcKesKDL
 uJ1V6S5ahK0Qt0sVHypKuOzPWZH3dJptX1JFzhdwqdRSNxng+kJfJd7mm2VofSITrREd
 bdwI9R07K8fru5MLdRFUWqh2KgMOsCTqWzjIzwu3p/Rl0p4B4WMicslhL3CfTe8L+ukb
 juRPn5CzYJbMOVGvB8WEFoiKpf8BmMQ48LOT4jpsuAL3DPajHQWRoKWWTjzkZ7rEF7Xc
 KnOF+yodCnVQwNiGjKANOiEfos5fW6WH1riLtmod+kr/lUi63uufN+zAfSavLTRNjl3Z
 p/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n8JGdBXj1nnf7gYy/LjTC9Yo5X3dAPPW+DajEprvTRY=;
 b=gUoGBtbzFXGxcd+HEGE2xVNN2tOGdHC+YgusI3hvw6e1gnNrClyadwlB5V3+57wICI
 3CGFk9/2B83EUtEpUN9T70J0qcUeamLko+98c/ZkiPjXKdnqBcaA3Q3BuhHBFki3VpEm
 bRsnPLICnlyuO7ziBmdaa7KPlh1nmbd+vT3WojqRuXbnZx4n11O2Wl3W5k/JNm7jYhSS
 TvaLYVTa5iuM5i3Nda/ks9YaaHx2bTm9T/ydCnUu8H6H1oBvZnoSYk53BF7zWB9HBHmJ
 oKfXfWqGOvzRnouHeRlthGOCa/rrn7x7htjBcG4cnhKdM6S2wOgag6T2eA+UH7V7JNlM
 if3w==
X-Gm-Message-State: AOAM533upkqR/O9r81nBvGJeo75SG+5+xKSgKBrfdsgfw6wYTEh98Emu
 o6NU0Gy+47fnY4pBQ7xcHQ==
X-Google-Smtp-Source: ABdhPJypHp1X93Oh07tz8ThKUvJXyynNSLVyXM4a5klRSufV9gljRP2rYToOEq0pCoiX3nT407CGEA==
X-Received: by 2002:a17:90a:8:: with SMTP id 8mr2777106pja.236.1606385164238; 
 Thu, 26 Nov 2020 02:06:04 -0800 (PST)
Received: from PWN ([116.92.233.28])
 by smtp.gmail.com with ESMTPSA id i10sm4405306pfk.206.2020.11.26.02.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 02:06:03 -0800 (PST)
Date: Thu, 26 Nov 2020 05:05:58 -0500
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Message-ID: <20201126100558.GA7169@PWN>
References: <20201126094727.43265-1-dwaipayanray1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126094727.43265-1-dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: fix
 TYPO_SPELLING check for words with apostrophe
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

On Thu, Nov 26, 2020 at 03:17:27PM +0530, Dwaipayan Ray wrote:
> checkpatch reports a false warning for some words containing an
> apostrophe.
> 
> A false positive is "doesn't". Occurrence of the word causes
> checkpatch to emit the following warning:
> 
> "WARNING: 'doesn'' may be misspelled - perhaps 'doesn't'?"
> 
> Check if any word character is present after the word boundary
> in such cases. If present, it means a subpart of the word has
> been matched and a warning should not be emitted.
> 
> Reported-by: Peilin Ye <yepeilin.cs@gmail.com>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for fixing it! Glad to see checkpatch is happy :)

FWIW, the patch is:
Tested-by: Peilin Ye <yepeilin.cs@gmail.com>

Thanks,
Peilin Ye

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
