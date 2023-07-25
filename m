Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275BFC04A6A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Jul 2023 03:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB73C400FE;
	Tue, 25 Jul 2023 03:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB73C400FE
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EytyoMnx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tFBoIZRBCz3D; Tue, 25 Jul 2023 03:40:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8D657400A4;
	Tue, 25 Jul 2023 03:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D657400A4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5FAB6C0072;
	Tue, 25 Jul 2023 03:40:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67A1DC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 03:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A7CD81A8E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 03:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A7CD81A8E
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=EytyoMnx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ph3W5zLK9lcF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 03:40:02 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34B3B81A6D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 03:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34B3B81A6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690256401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GISuUr8VKD3+R5zYA0JDar9R1Gto/+3V5HYVR91I9wg=;
 b=EytyoMnxQuOw+exMeOUAnX3keOv+g2Uv2TxVxywQGAwfQL2Ovw42eSel4/Yt3+e2l1UfLv
 LnKEL288dGgkfcHzzDqmTDDDC4UpLUXyla271UePPdXmPxONieByWCs+91CgEv5Igh7DDg
 Rads8xAA4Mcp2yvdYzoC+9vRQXtXM2g=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-GIfbsP7eNeOYx-8qTrVMYg-1; Mon, 24 Jul 2023 23:39:58 -0400
X-MC-Unique: GIfbsP7eNeOYx-8qTrVMYg-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b6f51e170fso42458081fa.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 20:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690256397; x=1690861197;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GISuUr8VKD3+R5zYA0JDar9R1Gto/+3V5HYVR91I9wg=;
 b=SzloX5p1t7aJE0bBOuXTiWbjYVrQff8P0pbZn4z2ioMnZj0nCmQSYoYF/kdyXsssn7
 HE5RAyyJPtBqVRTI2DvZwvZql5iL0QNn552O6bPGFw2d55rXS0zMvJxtsh+Cik7wL+sV
 6rP2QWb+I/+7lPWyhkuLyoIfzr8ZHUilhvfGiK/MIYFv2He0gvLI/4M3i8/JhROHWyYC
 2l78KpY9RBEbaqZv3xL7CiwfvUUzT+Ar+11ag4fA4JSD2Bny+vTTaGVShRiMWtb8y8y4
 NxquPMEUWDrOgIY6tDZW8T4N5jaEqNwIsrQ7Ak4kqqMZ1M33YOfOXPT3MRYDfyv7/IXe
 z6jQ==
X-Gm-Message-State: ABy/qLa0iwzXvmqpppeDjWpxiMqK/QydICGTzHYSiebDj7WrMSBWyIaZ
 DUZEIAHEG2f4Ozzo9reHlfqv5d1l8TcicMY2wCgkSBkrZMyRpHSLFSsIpCyfIsi+UsGP7yOh95F
 2ldjXuBlV9P4tCDlhFKfJMzGiNpZ+179fl9aZ3kBjmgFcbez/uPMrjWBKehEaBzuy
X-Received: by 2002:a2e:a0cc:0:b0:2b9:20fe:4bc4 with SMTP id
 f12-20020a2ea0cc000000b002b920fe4bc4mr6712990ljm.40.1690256397225; 
 Mon, 24 Jul 2023 20:39:57 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFAZsBRP+Cx9Rj7r5jrD6td5p8IVRIg7B6cy0snnenBCqMo5IsS1kwAaaIV25dcC36SsUrktKHa01Fvrdsb4oo=
X-Received: by 2002:a2e:a0cc:0:b0:2b9:20fe:4bc4 with SMTP id
 f12-20020a2ea0cc000000b002b920fe4bc4mr6712982ljm.40.1690256396951; Mon, 24
 Jul 2023 20:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230724221326.384-1-andrew.kanner@gmail.com>
 <20230724221326.384-2-andrew.kanner@gmail.com>
In-Reply-To: <20230724221326.384-2-andrew.kanner@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 25 Jul 2023 11:39:46 +0800
Message-ID: <CACGkMEt+LW8FBNwcn6f0cBwTOuKy+ZPy3Smg6fJgo9OrCUAOjQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drivers: net: prevent tun_can_build_skb() to exceed
 xdp size limits
To: Andrew Kanner <andrew.kanner@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, edumazet@google.com,
 brouer@redhat.com, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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

T24gVHVlLCBKdWwgMjUsIDIwMjMgYXQgNjoxNeKAr0FNIEFuZHJldyBLYW5uZXIgPGFuZHJldy5r
YW5uZXJAZ21haWwuY29tPiB3cm90ZToKPgo+IFRlc3RlZCB3aXRoIHN5emthbGxlciByZXBybyB3
aXRoIHJlZHVjZWQgcGFja2V0IHNpemUuIEl0IHdhcwo+IGRpc2NvdmVyZWQgdGhhdCBYRFBfUEFD
S0VUX0hFQURST09NIGlzIG5vdCBjaGVja2VkIGluCj4gdHVuX2Nhbl9idWlsZF9za2IoKSwgYWx0
aG91Z2ggcGFkIG1heSBiZSBpbmNyZW1lbnRlZCBpbgo+IHR1bl9idWlsZF9za2IoKS4KPgo+IEZp
eGVzOiA3ZGYxMzIxOWQ3NTcgKCJ0dW46IHJlc2VydmUgZXh0cmEgaGVhZHJvb20gb25seSB3aGVu
IFhEUCBpcyBzZXQiKQo+IExpbms6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3RleHQ/
dGFnPVJlcHJvQyZ4PTEyYjI1OTNlYTgwMDAwCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEthbm5l
ciA8YW5kcmV3Lmthbm5lckBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbmV0L3R1bi5jIHwg
OCArKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvdHVuLmMgYi9kcml2ZXJzL25ldC90dW4u
Ywo+IGluZGV4IDE4Y2NiYmU5ODMwYS4uY2RmMmJkODViMzgzIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbmV0L3R1bi5jCj4gKysrIGIvZHJpdmVycy9uZXQvdHVuLmMKPiBAQCAtMTU4Miw3ICsxNTgy
LDEzIEBAIHN0YXRpYyB2b2lkIHR1bl9yeF9iYXRjaGVkKHN0cnVjdCB0dW5fc3RydWN0ICp0dW4s
IHN0cnVjdCB0dW5fZmlsZSAqdGZpbGUsCj4gIHN0YXRpYyBib29sIHR1bl9jYW5fYnVpbGRfc2ti
KHN0cnVjdCB0dW5fc3RydWN0ICp0dW4sIHN0cnVjdCB0dW5fZmlsZSAqdGZpbGUsCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaW50IGxlbiwgaW50IG5vYmxvY2ssIGJvb2wgemVyb2Nv
cHksIGludCAqc2tiX3hkcCkKPiAgewo+IC0gICAgICAgaWYgKFNLQl9EQVRBX0FMSUdOKGxlbiAr
IFRVTl9SWF9QQUQpICsKPiArICAgICAgIGludCBwYWQgPSBUVU5fUlhfUEFEOwo+ICsgICAgICAg
c3RydWN0IGJwZl9wcm9nICp4ZHBfcHJvZyA9IHJjdV9kZXJlZmVyZW5jZSh0dW4tPnhkcF9wcm9n
KTsKClRoaXMgbWlzc2VzIHJjdSByZWFkIGxvY2suCgpJIHdvbmRlciBpZiB0aGluZ3MgY291bGQg
YmUgc2ltcGxlciBpZiB3ZSBtb3ZlIHRoZSBsaW1pdCBjaGVjayBmcm9tCnR1bl9jYW5fYnVpbGRf
c2tiKCkgdG8gdHVuX2J1aWxkX3NrYigpOgoKcmN1X3JlYWRfbG9jaygpOwp4ZHBfcHJvZyA9IHJj
dV9kZXJlZmVyZW5jZSh0dW4tPnhkcF9wcm9nKTsKICAgICAgICBpZiAoeGRwX3Byb2cpCiAgICAg
ICAgICAgICAgICBwYWQgKz0gWERQX1BBQ0tFVF9IRUFEUk9PTTsKYnVmbGVuICs9IFNLQl9EQVRB
X0FMSUdOKGxlbiArIHBhZCk7CnJjdV9yZWFkX3VubG9jaygpOwoKVGhhbmtzCgo+ICsKPiArICAg
ICAgIGlmICh4ZHBfcHJvZykKPiArICAgICAgICAgICAgICAgcGFkICs9IFhEUF9QQUNLRVRfSEVB
RFJPT007Cj4gKwo+ICsgICAgICAgaWYgKFNLQl9EQVRBX0FMSUdOKGxlbiArIHBhZCkgKwo+ICAg
ICAgICAgICAgIFNLQl9EQVRBX0FMSUdOKHNpemVvZihzdHJ1Y3Qgc2tiX3NoYXJlZF9pbmZvKSkg
PiBQQUdFX1NJWkUpIHsKPiAgICAgICAgICAgICAgICAgKnNrYl94ZHAgPSAwOwo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gZmFsc2U7Cj4gLS0KPiAyLjM5LjMKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGlu
ZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2Vy
bmVsLW1lbnRlZXMK
