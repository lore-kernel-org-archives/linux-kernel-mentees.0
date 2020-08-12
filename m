Return-Path: <SRS0=//YW=BW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CDDC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Aug 2020 20:34:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E082C20774
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Aug 2020 20:34:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJYKq7rh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E082C20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A4D25813F4;
	Wed, 12 Aug 2020 20:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OIkJ6E-ZlIjM; Wed, 12 Aug 2020 20:34:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 470598637D;
	Wed, 12 Aug 2020 20:34:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 312D7C013C;
	Wed, 12 Aug 2020 20:34:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0F37C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 20:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5A49A241AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 20:34:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nSyztmI3fGyy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 20:34:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by silver.osuosl.org (Postfix) with ESMTPS id E18CF241A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 20:34:17 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id s23so2580821qtq.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 13:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=8AbcIfen2Mh3O6xshAeb42qMiceFCwU8VY+DtJghWKc=;
 b=JJYKq7rhGfoskc0IOYL0mQ2UgiV0NUPZnUMJqm0x4+mN+Jnr5eSGxbVsmV3va+QmiF
 wjNsakLNmG8Snq4Ka54NHi+FMZOfkPc/P2UAnRuTKgJxYoDYNvYxnt9ubGhb/1D4XEbF
 R5s86RQJgzcMqdEQLZP6mi/nb4RuLVBQmVI4891ly/7eIdpFM1zpDZkPWag8mXnTxtoy
 vTo5GBX5MwVspiDm8HromEAg+ZMCdOxBmSjbfjM12ucPoyMLi6Jr1WBIZ8qAoOffTuuf
 J8cG90cIOw+EUXScq3d98Z/wlHZasQ2HIKPuWFa0h1c1TvCj5gslLqFBv4AiKd9iNLAP
 uURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8AbcIfen2Mh3O6xshAeb42qMiceFCwU8VY+DtJghWKc=;
 b=hER2hUpR94pOBSo/uqdwOfhodECJmNWynNF7b9Dtl4llBXlhF1VfnDtD8bkR/ykYN6
 e0pqcDIOqps4t4DTfbZwkAhiNkP84E5vcJYQIvSz5hWs0IT0cRi2gm9jZ8CyAapjt5Uv
 5T+MqEebjKQjLAg52gwj+5mgEHZc/clFmgL0bJfQM2duVE9tuHIFl0/z8sD1MCVjEthQ
 lkLEZfMyGU3Gv/mZucfE7spg1CtsN/+T7fI12zULSNRysKzZGWBzsIpFKZRSOWcbduoH
 lpDh9wXBtiPr/z8ZLhFBPBSi8Fh+gF+iist4XwcseEmU86af0z2BIpcTdAn7bhhXDJnR
 GF8A==
X-Gm-Message-State: AOAM531F7kaIRo1Ynqfe1OPZhOadMq2HDjf6dIsKLX2vYfueb3xK5Cyu
 g1BqhOFrCDb6u3dh9HRXRz8=
X-Google-Smtp-Source: ABdhPJx64TW/NqTIbSDn9AtxCM0KEpE57asspn5bN7J15aOPfo8WvWruSQ6i+zwyQrbngY2hClZEPw==
X-Received: by 2002:ac8:130a:: with SMTP id e10mr1710881qtj.38.1597264456887; 
 Wed, 12 Aug 2020 13:34:16 -0700 (PDT)
Received: from eaf ([190.19.79.86])
 by smtp.gmail.com with ESMTPSA id o13sm3651241qko.48.2020.08.12.13.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 13:34:16 -0700 (PDT)
Date: Wed, 12 Aug 2020 17:34:10 -0300
From: Ernesto =?utf-8?Q?A=2E_Fern=C3=A1ndez?= <ernesto.mnd.fernandez@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200812203410.GA6168@eaf>
References: <20200812065556.869508-1-yepeilin.cs@gmail.com>
 <20200812070827.GA1304640@kroah.com> <20200812071306.GA869606@PWN>
 <20200812085904.GA16441@kadam> <20200812202420.GA5873@eaf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812202420.GA5873@eaf>
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] hfs,
 hfsplus: Fix NULL pointer dereference in hfs_find_init()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gV2VkLCBBdWcgMTIsIDIwMjAgYXQgMDU6MjQ6MjBQTSAtMDMwMCwgRXJuZXN0byBBLiBGZXJu
w6FuZGV6IHdyb3RlOgo+IElmIHRoYXQncyB3aGF0IHRoZSByZXByb2R1Y2VyIGlzIGFib3V0LCBJ
IHRoaW5rIGp1c3QgcmV0dXJuaW5nIGFuIGVycm9yIGlzCj4gcmVhc29uYWJsZS4KCkkgZ3Vlc3Mg
aXQgd291bGQgYmUgYmV0dGVyIHRvIHB1dCBhIGNoZWNrIGluc2lkZSBoZnNwbHVzX2lub2RlX3Jl
YWRfZm9yaygpLAp0byB2ZXJpZnkgdGhhdCB0aGUgZmlyc3QgZXh0ZW50IGlzIGFsd2F5cyBpbiB0
aGUgcmlnaHQgcGxhY2UgYW5kIHdpZGUKZW5vdWdoLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QK
TGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVu
dGVlcwo=
