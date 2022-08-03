Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3071AC19F28
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Aug 2022 08:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE76040A8B;
	Wed,  3 Aug 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE76040A8B
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K1+QwMMF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ueySpXTEo2lT; Wed,  3 Aug 2022 08:48:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D353040476;
	Wed,  3 Aug 2022 08:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D353040476
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEC6AC0033;
	Wed,  3 Aug 2022 08:48:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10CB5C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 08:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D651940A8B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 08:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D651940A8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TABMSRe7K1mm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 08:48:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21E8E40476
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21E8E40476
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 08:48:23 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 j4-20020a05600c1c0400b003a4f287418bso543432wms.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 03 Aug 2022 01:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qKqo0h9Lva8dP5VOOSo7i61+QrtY8gPr4MgxUM+NaXM=;
 b=K1+QwMMF0ygQFYNEgKo0BPINIfeDi/62w29AVXiJ+sIPO5wYV7vOKSvv4nkNCLXUYd
 mpBPtDtwoH1NBnjlBqlWtVec1LV7ZWeJ0TeRNSVIJi7+YntM4Z0tf34zRJMcc0WoYzmN
 PdEVxwu1atJIytuGyf3tF6oDOybJYk/8SWK+kd8v6fvxu5fqODnJFPI5KtXERKSbDljv
 XPwFvWejnp8S3o12ZlA9tKbpn57sEnkWliG64dOnXEqKtf5FJ/2meiXN+MyDT40B0iNJ
 8Xe8/wEgxquFW3z0BRp7MYS4I0OhVqrTJ6ATOFcuzBRdKRoFXkho5Kf+YkpO9y6kLhDe
 JF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=qKqo0h9Lva8dP5VOOSo7i61+QrtY8gPr4MgxUM+NaXM=;
 b=0lU2DgRP9ZNqkFKQxu97qAlCuuZmQg6iRHgoAVMGAdR65C4KF0JLPhKp2m2oNN0YmB
 cN/HQMvI1Tr7+O9eRsqZwwT5rMXTYP6Sk7qE3MefcJG5pkMz5g6T0idsUk3gtJOj6Nw4
 LGBQixdR3NyPqmrLwNN4WpnTSQY9vq9Z6ff74wYYnehXJiGF2Gq83lzIhM46HBFt44Y9
 ujiHSrfunv7h9oS9Anz2URrcSVoD0D+9eAKzjHL4f2eVVcNjmNvMyF8Lp8NgC1GRHjLp
 xEC67pdTKCSZSDFr8GsPMSCcIBnD/G4VXCoYMHIh3QNuR/915DTrsn13RNDyF91toyPk
 e5FA==
X-Gm-Message-State: ACgBeo21h1NpKGOnKOChCVh/Su1feK2lfNM3S5sN66hSFM2//TOz4Adu
 sSkn0ka7ubmEQXQ6ep6cPls=
X-Google-Smtp-Source: AA6agR78xbQ3KK5qK5KyQWJM4Kybr6qyH51YeUilppnNGY+xV1TAQkEXrPe1nRJuq8Z/s0lxwWTh8g==
X-Received: by 2002:a1c:2981:0:b0:3a2:ffe9:945c with SMTP id
 p123-20020a1c2981000000b003a2ffe9945cmr2090453wmp.38.1659516501272; 
 Wed, 03 Aug 2022 01:48:21 -0700 (PDT)
Received: from gmail.com (84-236-113-167.pool.digikabel.hu. [84.236.113.167])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a5d67d2000000b0020fff0ea0a3sm17319128wrw.116.2022.08.03.01.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 01:48:20 -0700 (PDT)
Date: Wed, 3 Aug 2022 10:48:18 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH] x86/numa: Use cpumask_available instead of hardcoded
 NULL check
Message-ID: <Yuo2UkkyaYtZ3rMZ@gmail.com>
References: <20220731160913.632092-1-code@siddh.me>
 <YukFgFTaq4Aw+uht@gmail.com>
 <1825f63b142.8968bde3116633.1242410031840350968@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1825f63b142.8968bde3116633.1242410031840350968@siddh.me>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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


* Siddh Raman Pant <code@siddh.me> wrote:

> On Tue, 02 Aug 2022 16:37:44 +0530  Ingo Molnar <mingo@kernel.org> wrote:
> > Your fix makes sense I suppose, but I'm wondering how testing didn't 
> > trigger this warning.
> > 
> > Off-stack isn't a rare config option:
> > 
> >   kepler:~/tip> make allmodconfig
> >   #
> >   # No change to .config
> >   #
> >   kepler:~/tip> grep CPUMASK_OFFSTACK .config
> >   CONFIG_CPUMASK_OFFSTACK=y
> >   kepler:~/tip> 
> > 
> > What am I missing?
> 
> Maybe this triggers on certain config options set, or maybe due to new
> gcc version? (I'm using gcc-12, I also likely saw while on gcc-11.)
> It nevertheless is a helpful warning.
> 
> I just now tried `make defconfig` (default configuration based on
> 'x86_64_defconfig') and compiling with `make -j13 all`, and gcc doesn't
> give any warning. (CONFIG_CPUMASK_OFFSTACK isn't even listed in the
> .config file produced, grep fails.)

Does 'allmodconfig' reproduce the warning for you:

  $ make allmodconfig
  $ make arch/x86/mm/numa.o

?

If yes, then this could be due to gcc-12, as it doesn't reproduce with 
gcc-11 for me:

   gcc version 11.2.0 (Ubuntu 11.2.0-19ubuntu1) 

Thanks,

	Ingo
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
