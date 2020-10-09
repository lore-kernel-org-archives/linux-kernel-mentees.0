Return-Path: <SRS0=yWZE=DQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 807D3C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  9 Oct 2020 03:34:37 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A33D20739
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  9 Oct 2020 03:34:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p2ezw0xF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A33D20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8657286F0B;
	Fri,  9 Oct 2020 03:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 52CKTrnq6FHC; Fri,  9 Oct 2020 03:34:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 76D1886DAB;
	Fri,  9 Oct 2020 03:34:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5BA6AC016F;
	Fri,  9 Oct 2020 03:34:34 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CD8EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 03:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 59C4D87436
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 03:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hZXUU6xzEhtn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 03:34:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3E17287425
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 03:34:32 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id dn5so7889413edb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 08 Oct 2020 20:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=cXNFzA60Xgv7cww59U+dHgF4OjTkdlSXSSsiskYO+jU=;
 b=p2ezw0xF2FhusWHbBZulc6YXfcZgp1RhveE3AfTUR9KMsrm5mZFCPTlI/kF4pX7TRv
 7k6jxKPFCxWFKGQGaP6Sm42lxijFjvFxIiCPQLICPbhergqqt0+soeD18MfepiqTQ7ou
 +yskIT/1Eawtx+TOGMWx4LZthF357tPfL5XgIobfKNBw3uogioNJeF2+xCTMY1cbwZZf
 4F3dU08alD+x7JamQm8A+AntZffDfgdGELDBocPZ/6gYsih4bnYklKVBCxDzl3OY9lfz
 GKcM3Or1v5F7lU3jkUQ3Hf0ZpkLc2IJ6EeupwwwzElNXl/Xk9yqk+p0QuiL3VOzXzQ2X
 MsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=cXNFzA60Xgv7cww59U+dHgF4OjTkdlSXSSsiskYO+jU=;
 b=agaI0stDJexoyCGC82Co9K96WADq7AP1FtiMBfRehsU8iiQJK2JSZlf71vXtrIKANh
 xM1+u2tqIpDUaZSn8cDtpKvKt0/7SF6XJbR69vJa8/qEEBHuW2WpnPqlT7GsQD977d90
 4w7Po+fwMK2/dygE6qmQXC8clgyhcaJ6uJsLjUBu9L0ZOOBkTdou9gK/xaL2hMKH910o
 OpYPwunFGNG04OdPOqsfDnIGqOcEnpihlx0kA8fOjk+JLG8Qd239TKdkMJNNvg72Qvs2
 Kvngpal/BrznuBiTdC0aq3ULV3vfwKZT6clXZ4QDBnaTnAdBrHO15pjCkoqRxzZ84eAu
 mnaA==
X-Gm-Message-State: AOAM532jnUgNjQ0trYkss8pggHqJbfDxXacJ3S6qQfvFDmDrFMBzLczn
 uqgwbCb5vfLehx7k4Y6XGyI=
X-Google-Smtp-Source: ABdhPJyz98qrEBu/wKV08ObuDbxavmpYreVmSEcY2cyG3A6w2xKoIarDWlYCgm5TMO5srCGFBLNaXA==
X-Received: by 2002:a05:6402:21c5:: with SMTP id
 bi5mr12713815edb.380.1602214470549; 
 Thu, 08 Oct 2020 20:34:30 -0700 (PDT)
Received: from felia ([2001:16b8:2d6e:f600:80f1:4ea4:2130:b98])
 by smtp.gmail.com with ESMTPSA id cw15sm5470368ejb.47.2020.10.08.20.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 20:34:29 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Fri, 9 Oct 2020 05:34:28 +0200 (CEST)
X-X-Sender: lukas@felia
To: Aditya Srivastava <yashsri421@gmail.com>
In-Reply-To: <CAJ7RK2uORT4aM=wJwjGmWW_-NAbqLyF=6BbjbT6W40OMS=MRgg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2010090527580.15995@felia>
References: <CAJ7RK2sHrjQ+toe-Wav6dWcyyMRtokUOaeaN95=YA87VQjZS0w@mail.gmail.com>
 <alpine.DEB.2.21.2010060630530.10609@felia>
 <CAJ7RK2tTF5cmQk2RVXUPFkVF1Cq60KhMBTriJcwDOEnaV5b3TA@mail.gmail.com>
 <alpine.DEB.2.21.2010072019210.7221@felia>
 <CAJ7RK2uORT4aM=wJwjGmWW_-NAbqLyF=6BbjbT6W40OMS=MRgg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Applying for community bridge and
 getting started with checkpatch.pl
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

Dear Aditya,

Dwaipayan Ray has suggested the following change to checkpatch.pl:

https://lore.kernel.org/linux-kernel-mentees/20201007192029.551744-1-dwaipayanray1@gmail.com/


Can you please test what are the errors and warnings checkpatch.pl reports 
on v5.6..v5.8 before this patch is applied and what are the errors and 
warnings after this patch is applied?

(You can already find a state in linux-next where this patch is already in 
git.)

Can you present the differences in a suitable aggregated form, so that we 
can see the differences nicely in numbers and the kind of errors and 
warnings changing?

When you understand how to do that, the next task would be to improve 
checkpatch.pl yourself.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
