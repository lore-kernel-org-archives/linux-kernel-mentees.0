Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A45C00528
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Aug 2023 18:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2965940A66;
	Tue,  1 Aug 2023 18:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2965940A66
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=dZ5ZtDYP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2T0qz8qBl4ii; Tue,  1 Aug 2023 18:48:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 391C740574;
	Tue,  1 Aug 2023 18:48:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 391C740574
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26033C0071;
	Tue,  1 Aug 2023 18:48:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B28FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 18:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC5DC60BE8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 18:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC5DC60BE8
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20221208 header.b=dZ5ZtDYP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1QHgM39_rEzU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 18:48:42 +0000 (UTC)
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 460CF60E3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 18:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 460CF60E3A
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6bc9efb5091so86386a34.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Aug 2023 11:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690915721; x=1691520521;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FQAbJDerUlyQlHf1jSIoWyuxn5TGn42tyHmHZ8lOjYA=;
 b=dZ5ZtDYPfxzMUtXpB0P5lTrMtYNZpcjOiHw9nQl00zgi2aIPhljQx0UbJxTPLm3FZT
 vSdKkfdfnf/VZ1WWjLFA+gOih0wO3rGdrU99HIZNE+YfPpCFNn5+MHswjkrAn8ony5OZ
 snvnx2Wg+HGMkNOQVXRQdrDCa9hkEnFW848HQXwQBAHu4kB2pcgK9dE3xwtIcHWhIOqj
 W47OSujvk4aB/pb4BtfemJd3ixX24sCR39+e/+b3Md6peicHXhFogygbpfVwWbfpAV3v
 OEX9ZegobY8kq/oXSL/gpYaWpcicUcb0B2fiqnc2vtw5IpYK7p4LEtTgI2fBqVG1IEWs
 rdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690915721; x=1691520521;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FQAbJDerUlyQlHf1jSIoWyuxn5TGn42tyHmHZ8lOjYA=;
 b=B0cg/nz61Vb+dgHPaRKDD04gsMsTkw18mg1+ouN9AUmF100XAshjwUDvYtEDBrZmzQ
 DHcpYGAw8xvFqTCVNogOWpvhN6u+so/JBMkQritJEdaNXz6hCdW0xSPUj8dG3bgrSSHq
 UPb0BWLnwSE9Ob5sp1NzCxhHjZBZRegjHuY3H8wu5tW2pDNuWmu/oO7MVEICcAFHWktc
 mJE4JDNH3xxqb1xg4vIXPin8gR2cxwWK9ftaP5TpXRjDpI6sdB3nmkyjaKythndO0sYJ
 gppIhaGE3XdhD2CTzsv/glwfmqSdH1YE/djA7p4TluvoIfbydu8CWl/OC3UxNHS2Y5YQ
 GUgA==
X-Gm-Message-State: ABy/qLbWauK9O0ps6MFG0yMU28PuA0f697ozBzgmCDe1MPviO2Tk0rMX
 45dcm80KuRzbJWummt3SFxAJ7b3ovQUwPaVnazCrWQ==
X-Google-Smtp-Source: APBJJlH4cRFkwbN+YB7mbc1RshczQGk5rkF7BXLU5bN3kMqh1okhqgAf4kDPo10MJcT6014eWGGppF5iRG91T1FaON0=
X-Received: by 2002:a9d:7cd1:0:b0:6b7:5777:f63e with SMTP id
 r17-20020a9d7cd1000000b006b75777f63emr11282137otn.9.1690915721080; Tue, 01
 Aug 2023 11:48:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230801155355.11885-1-tuananhlfc@gmail.com>
In-Reply-To: <20230801155355.11885-1-tuananhlfc@gmail.com>
Date: Tue, 1 Aug 2023 11:48:29 -0700
Message-ID: <CAKH8qBtcrWYGGar378i21OKVHcVVwqg-EPbpSyNc50t0RLuM0g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4] samples/bpf: Fix build out of source tree
To: Anh Tuan Phan <tuananhlfc@gmail.com>
Cc: daniel@iogearbox.net, martin.lau@linux.dev, ast@kernel.org,
 andrii@kernel.org, bpf@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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
From: Stanislav Fomichev via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Stanislav Fomichev <sdf@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gVHVlLCBBdWcgMSwgMjAyMyBhdCA4OjU04oCvQU0gQW5oIFR1YW4gUGhhbiA8dHVhbmFuaGxm
Y0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhpcyBjb21taXQgZml4ZXMgYSBmZXcgY29tcGlsYXRp
b24gaXNzdWVzIHdoZW4gYnVpbGRpbmcgb3V0IG9mIHNvdXJjZQo+IHRyZWUuIFRoZSBjb21tYW5k
IHRoYXQgSSB1c2VkIHRvIGJ1aWxkIHNhbXBsZXMvYnBmOgo+Cj4gZXhwb3J0IEtCVUlMRF9PVVRQ
VVQ9L3RtcAo+IG1ha2UgVj0xIE09c2FtcGxlcy9icGYKPgo+IFRoZSBjb21waWxhdGlvbiBmYWls
ZWQgc2luY2UgaXQgdHJpZWQgdG8gZmluZCB0aGUgaGVhZGVyIGZpbGVzIGluIHRoZQo+IHdyb25n
IHBsYWNlcyBiZXR3ZWVuIG91dHB1dCBkaXJlY3RvcnkgYW5kIHNvdXJjZSB0cmVlIGRpcmVjdG9y
eQo+Cj4gU2lnbmVkLW9mZi1ieTogQW5oIFR1YW4gUGhhbiA8dHVhbmFuaGxmY0BnbWFpbC5jb20+
CgpBY2tlZC1ieTogU3RhbmlzbGF2IEZvbWljaGV2IDxzZGZAZ29vZ2xlLmNvbT4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRl
ZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgta2VybmVsLW1lbnRlZXMK
