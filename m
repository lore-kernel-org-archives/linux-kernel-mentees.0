Return-Path: <SRS0=sA50=AN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9978C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 17:04:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0F3F20885
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 17:04:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLb/Puis"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0F3F20885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A08238AD53;
	Thu,  2 Jul 2020 17:04:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OWwPA65QxML8; Thu,  2 Jul 2020 17:04:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 40DA98AD3E;
	Thu,  2 Jul 2020 17:04:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FF6BC0890;
	Thu,  2 Jul 2020 17:04:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 936DBC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 17:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8FB928AD53
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 17:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HOYj3kLNywtR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 17:04:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 101B68AD3E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 17:04:02 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id z47so9157042uad.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 02 Jul 2020 10:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W7abyQ+nO1e3zFNQVjcKFt0DBVozSRyUVCzzjyEn7XU=;
 b=mLb/Puisrsyl9e+9wKRiHp5Tq8N9Qqi7AXkGnpjEMryA62rF5gsqxzAyij4m2HL6JK
 tkOQpczKTmoudMKJ1io0MWq3hk5u3Z6m++a8HHvikgtlyQw/FDuVxeefDGmVs/QubBIf
 fo07ggUC666fnwuzvOQIrj5Vbo/u7eYAdiymADO1Z1AH76x932TWNfovz0EdwpGi86Ob
 q9CYiaxcNx77cukdGp+m33xZVBQC0Sce2Idw3UoDkHb4T4R1panpKoFR3HnbqJj7qIOq
 ie46ml7vo9rFVOqfirf64zwiOqbpcp7WNuuN8VqETbVItChNFBDnoeAG1RFdTNPi6/yB
 kWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W7abyQ+nO1e3zFNQVjcKFt0DBVozSRyUVCzzjyEn7XU=;
 b=tQXNHum/LuWwAq8iQRDO92W0fFFjKkVkiQCL1QotJOedsoyNEYcTO/tPsfC8f022x7
 pV+ciJUNJNWy2b0O3Eh0aJt2BmqczTnSz8/EaSFUTJNaPXVsoA9KcejVxnmZU2AVplGX
 AHrWaSW4r8GCHUZtJPha2QyhYjmKMPrCMub9uik2J+O2c5kYCQ9hUgKWfsBxyK/EhPhT
 CUAtGSPoFBZegNHfkwHNS32i868v4BJAzbpr9JyC7Hu/J2MsdyTgaZY3/hvNRR5Kr0fs
 XsIp/Qap5EfPTYPbL2dMgOmPFKr+H6ble0In+sqhdnUdOCqJCe1N7nFmoASqj8nmicSW
 /sbg==
X-Gm-Message-State: AOAM531+oDWqQLtAxs9oT86NYyIzpyaD9l52XDkiWt7u1MYPUxFMSL2u
 iOELKQ7jbeONIIVfheYIirj50uwm9r8cdG+Wukc=
X-Google-Smtp-Source: ABdhPJxFGYCFDj2+ZKyRT9CJQ3VzeAHEvXOH+lMAstiCkuNZfVamKCSrktgnyH3ne9pM+ZVH+mPwjKvz6JjpBOzcvzM=
X-Received: by 2002:ab0:7056:: with SMTP id v22mr16569896ual.67.1593709440909; 
 Thu, 02 Jul 2020 10:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200702063632.289959-1-vaibhavgupta40@gmail.com>
 <20200702063632.289959-3-vaibhavgupta40@gmail.com>
 <20200702093645.13e0018a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200702093645.13e0018a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Date: Thu, 2 Jul 2020 22:32:21 +0530
Message-ID: <CAP+cEONGianqeie9HsVqVm6=LwKn_caF285U=vpdha0-+8B-ZA@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Shahed Shaikh <shshaikh@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
 Manish Chopra <manishc@marvell.com>, Rahul Verma <rahulv@marvell.com>,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
 netdev@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v1 2/2] qlcninc: use generic
	power management
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

T24gVGh1LCBKdWwgMiwgMjAyMCBhdCAxMDowNiBQTSBKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgIDIgSnVsIDIwMjAgMTI6MDY6MzIgKzA1MzAgVmFp
YmhhdiBHdXB0YSB3cm90ZToKPiA+IFdpdGggbGVnYWN5IFBNLCBkcml2ZXJzIHRoZW1zZWx2ZXMg
d2VyZSByZXNwb25zaWJsZSBmb3IgbWFuYWdpbmcgdGhlCj4gPiBkZXZpY2UncyBwb3dlciBzdGF0
ZXMgYW5kIHRha2VzIGNhcmUgb2YgcmVnaXN0ZXIgc3RhdGVzLiBBbmQgdGhleSB1c2UgUENJCj4g
PiBoZWxwZXIgZnVuY3Rpb25zIHRvIGRvIGl0Lgo+ID4KPiA+IEFmdGVyIHVwZ3JhZGluZyB0byB0
aGUgZ2VuZXJpYyBzdHJ1Y3R1cmUsIFBDSSBjb3JlIHdpbGwgdGFrZSBjYXJlIG9mCj4gPiByZXF1
aXJlZCB0YXNrcyBhbmQgZHJpdmVycyBzaG91bGQgZG8gb25seSBkZXZpY2Utc3BlY2lmaWMgb3Bl
cmF0aW9ucy4KPiA+Cj4gPiAuc3VzcGVuZCgpIGNhbGxzIF9fcWxjbmljX3NodXRkb3duLCB3aGlj
aCB0aGVuIGNhbGxzIHFsY25pY184Mnh4X3NodXRkb3duOwo+ID4gLnJlc3VtZSgpICBjYWxscyBf
X3FsY25pY19yZXN1bWUsICAgd2hpY2ggdGhlbiBjYWxscyBxbGNuaWNfODJ4eF9yZXN1bWU7Cj4g
Pgo+ID4gQm90aCAuLi44Mnh4Li4oKSBhcmUgZGVmaW5lIGluCj4gPiBkcml2ZXJzL25ldC9ldGhl
cm5ldC9xbG9naWMvcWxjbmljL3FsY25pY19ody5jIGFuZCBhcmUgdXNlZCBvbmx5IGluCj4gPiBk
cml2ZXJzL25ldC9ldGhlcm5ldC9xbG9naWMvcWxjbmljL3FsY25pY19tYWluLmMuCj4gPgo+ID4g
SGVuY2UgdXBncmFkZSB0aGVtIGFuZCByZW1vdmUgUENJIGZ1bmN0aW9uIGNhbGxzLCBsaWtlIHBj
aV9zYXZlX3N0YXRlKCkgYW5kCj4gPiBwY2lfZW5hYmxlX3dha2UoKSwgaW5zaWRlIHRoZW0KPiA+
Cj4gPiBDb21waWxlLXRlc3RlZCBvbmx5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFZhaWJoYXYg
R3VwdGEgPHZhaWJoYXZndXB0YTQwQGdtYWlsLmNvbT4KPgo+IGRyaXZlcnMvbmV0L2V0aGVybmV0
L3Fsb2dpYy9xbGNuaWMvcWxjbmljX2h3LmM6IEluIGZ1bmN0aW9uIOKAmHFsY25pY184Mnh4X3No
dXRkb3du4oCZOgo+IGRyaXZlcnMvbmV0L2V0aGVybmV0L3Fsb2dpYy9xbGNuaWMvcWxjbmljX2h3
LmM6MTY1Mjo2OiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUg4oCYcmV0dmFs4oCZIFstV3VudXNl
ZC12YXJpYWJsZV0KPiAgMTY1MiB8ICBpbnQgcmV0dmFsOwo+ICAgICAgIHwgICAgICBefn5+fn4K
Rml4ZWQgaW4gdjIuClRoYW5rcyEKCi0tVmFpYmhhdiBHdXB0YQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5n
IGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJu
ZWwtbWVudGVlcwo=
