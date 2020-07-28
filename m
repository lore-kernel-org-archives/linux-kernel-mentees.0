Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E7EC433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 06:13:19 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AB22207E8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 06:13:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbl+AJvV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AB22207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2A71C87E3F;
	Tue, 28 Jul 2020 06:13:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aX22nF6QYQp8; Tue, 28 Jul 2020 06:13:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8649287D76;
	Tue, 28 Jul 2020 06:13:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D23DC004F;
	Tue, 28 Jul 2020 06:13:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B306C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 06:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E7E1286FBB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 06:13:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bt3utjVIoO88
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 06:13:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BFE7786AF0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 06:13:15 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id k20so9278159wmi.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 23:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2LOYqENCC/eIrr+vps1mwgcYedxxXRrO5H846Z3NgUo=;
 b=mbl+AJvVCtxBnMFq8DuuLlqHTL4gHyTbIOttBv3k953y68Z+1ntGiEJRFlYBKXDUxq
 at3beMmZ4nYgwETfxeHttu1lrrMnXw0cW8mc5UZO/1PcdRAhE7gdK6GdySWKB4TKOJxU
 9q9X9YSryZesE2SCSJhjQXwims5fwEE5U5FGQeR8kMT28xrUEy70mSktfOGDPA9BvZVN
 yZR3DqusSGWjbi/CwYdY8K4YbMJm1Od95W/nts2/h/sbinAi1cFhnkpDhiL5lsJZtyU5
 ILD5h9KIxEIMzfohPLpXsk69jBNUJsrgRx+VaRWT1O8A7dc42EcIMrP9QRJ6aLns3yH2
 Z7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2LOYqENCC/eIrr+vps1mwgcYedxxXRrO5H846Z3NgUo=;
 b=ElqInB/kjiHv4q7XXFwWfC85LtZ25BLLNPIJ48guD2ausI4Hs+24Mxzi4YnKMjtSVe
 nm87qfodAeCA8j8Xm8cHyQFiQ80hIfqgP2e9hRJbQvf20FUNNCgm3lzda184dllHVMuP
 8neRri4aKxV/OLUfmaI7hF+smJp12e2AvoC1cmgaRg+8wd5zUiqXgdofLypvmqRGlfHQ
 hY/RVOgVxTdCItBr0RaT6Lectqid/Su7+1tJ/oC0H7pLPblCU98yY+y/sfg7TirIKb/o
 ZT9nEwOol1p3DzPX7vJuD2qcHurJCEiBCscC7aar1Quxgj2Y6mtbY8qKyYG7MaFap0SA
 NlwA==
X-Gm-Message-State: AOAM530OEnHyxKwMSXZi2XWbFOgIq7cVASWHIyLcQVfBLGfGY/FjI1Vx
 1heOwLI8yS370XI6E1c9brEIC0WMmHJ5bvht6oA=
X-Google-Smtp-Source: ABdhPJwKUkxs+d357LpYlMASpcmzCNyn5RrFCm2qRWLTxjhfXBdb6r0YA/TsXS8zNQXf6lOL5ngxxwj75vxOnsyr8V0=
X-Received: by 2002:a7b:c857:: with SMTP id c23mr2586762wml.155.1595916794109; 
 Mon, 27 Jul 2020 23:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200728022859.381819-1-yepeilin.cs@gmail.com>
 <20200728053604.404631-1-yepeilin.cs@gmail.com>
In-Reply-To: <20200728053604.404631-1-yepeilin.cs@gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Tue, 28 Jul 2020 08:13:05 +0200
Message-ID: <CAJ+HfNhvM8+nfvEC2h+hjR5SGHU7_qyFkNxtiM1yjod6yVB0vQ@mail.gmail.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
Cc: Song Liu <songliubraving@fb.com>, LKML <linux-kernel@vger.kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Arnd Bergmann <arnd@arndb.de>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, Yonghong Song <yhs@fb.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Netdev <netdev@vger.kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, KP Singh <kpsingh@chromium.org>,
 Jakub Kicinski <kuba@kernel.org>, bpf <bpf@vger.kernel.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 Andrii Nakryiko <andriin@fb.com>, "David S. Miller" <davem@davemloft.net>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH net v2] xdp: Prevent
 kernel-infoleak in xsk_getsockopt()
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

T24gVHVlLCAyOCBKdWwgMjAyMCBhdCAwNzozNywgUGVpbGluIFllIDx5ZXBlaWxpbi5jc0BnbWFp
bC5jb20+IHdyb3RlOgo+Cj4geHNrX2dldHNvY2tvcHQoKSBpcyBjb3B5aW5nIHVuaW5pdGlhbGl6
ZWQgc3RhY2sgbWVtb3J5IHRvIHVzZXJzcGFjZSB3aGVuCj4gYGV4dHJhX3N0YXRzYCBpcyBgZmFs
c2VgLiBGaXggaXQuCj4KPiBGaXhlczogOGFhNWEzMzU3OGU5ICgieHNrOiBBZGQgbmV3IHN0YXRp
c3RpY3MiKQo+IFN1Z2dlc3RlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFj
bGUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFBlaWxpbiBZZSA8eWVwZWlsaW4uY3NAZ21haWwuY29t
Pgo+IC0tLQoKQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuLnRvcGVsQGludGVsLmNvbT4K
Cj4gRG9pbmcgYD0ge307YCBpcyBzdWZmaWNpZW50IHNpbmNlIGN1cnJlbnRseSBgc3RydWN0IHhk
cF9zdGF0aXN0aWNzYCBpcwo+IGRlZmluZWQgYXMgZm9sbG93czoKPgo+IHN0cnVjdCB4ZHBfc3Rh
dGlzdGljcyB7Cj4gICAgICAgICBfX3U2NCByeF9kcm9wcGVkOwo+ICAgICAgICAgX191NjQgcnhf
aW52YWxpZF9kZXNjczsKPiAgICAgICAgIF9fdTY0IHR4X2ludmFsaWRfZGVzY3M7Cj4gICAgICAg
ICBfX3U2NCByeF9yaW5nX2Z1bGw7Cj4gICAgICAgICBfX3U2NCByeF9maWxsX3JpbmdfZW1wdHlf
ZGVzY3M7Cj4gICAgICAgICBfX3U2NCB0eF9yaW5nX2VtcHR5X2Rlc2NzOwo+IH07Cj4KPiBXaGVu
IGJlaW5nIGNvcGllZCB0byB0aGUgdXNlcnNwYWNlLCBgc3RhdHNgIHdpbGwgbm90IGNvbnRhaW4g
YW55Cj4gdW5pbml0aWFsaXplZCAiaG9sZXMiIGJldHdlZW4gc3RydWN0IGZpZWxkcy4KPgo+IENo
YW5nZXMgaW4gdjI6Cj4gICAgIC0gUmVtb3ZlIHRoZSAiQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmciIHRhZy4gKFN1Z2dlc3RlZCBieSBTb25nIExpdQo+ICAgICAgIDxzb25nbGl1YnJhdmluZ0Bm
Yi5jb20+KQo+ICAgICAtIEluaXRpYWxpemUgYHN0YXRzYCBieSBhc3NpZ25tZW50IGluc3RlYWQg
b2YgdXNpbmcgbWVtc2V0KCkuCj4gICAgICAgKFN1Z2dlc3RlZCBieSBTb25nIExpdSA8c29uZ2xp
dWJyYXZpbmdAZmIuY29tPikKPgo+ICBuZXQveGRwL3hzay5jIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9uZXQv
eGRwL3hzay5jIGIvbmV0L3hkcC94c2suYwo+IGluZGV4IDI2ZTNiYmE4YzIwNC4uYjJiNTMzZWRk
ZWJmIDEwMDY0NAo+IC0tLSBhL25ldC94ZHAveHNrLmMKPiArKysgYi9uZXQveGRwL3hzay5jCj4g
QEAgLTg0MCw3ICs4NDAsNyBAQCBzdGF0aWMgaW50IHhza19nZXRzb2Nrb3B0KHN0cnVjdCBzb2Nr
ZXQgKnNvY2ssIGludCBsZXZlbCwgaW50IG9wdG5hbWUsCj4gICAgICAgICBzd2l0Y2ggKG9wdG5h
bWUpIHsKPiAgICAgICAgIGNhc2UgWERQX1NUQVRJU1RJQ1M6Cj4gICAgICAgICB7Cj4gLSAgICAg
ICAgICAgICAgIHN0cnVjdCB4ZHBfc3RhdGlzdGljcyBzdGF0czsKPiArICAgICAgICAgICAgICAg
c3RydWN0IHhkcF9zdGF0aXN0aWNzIHN0YXRzID0ge307Cj4gICAgICAgICAgICAgICAgIGJvb2wg
ZXh0cmFfc3RhdHMgPSB0cnVlOwo+ICAgICAgICAgICAgICAgICBzaXplX3Qgc3RhdHNfc2l6ZTsK
Pgo+IC0tCj4gMi4yNS4xCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1t
ZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
