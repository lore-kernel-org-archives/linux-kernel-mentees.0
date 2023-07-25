Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F89DC0015E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Jul 2023 10:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6B15416D2;
	Tue, 25 Jul 2023 10:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6B15416D2
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=LXifjZ/m
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GoYNBZOo6sSE; Tue, 25 Jul 2023 10:49:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 73A0B402BC;
	Tue, 25 Jul 2023 10:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73A0B402BC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46103C0072;
	Tue, 25 Jul 2023 10:49:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD638C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 10:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 843CB60AA8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 10:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 843CB60AA8
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=LXifjZ/m
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rybtATbOuu6G
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 10:49:31 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF3A2606C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 10:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF3A2606C6
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fdddf92b05so7935075e87.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 03:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690282169; x=1690886969;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xKaUQGPjdDfYhdrv9D3r8wNt4DpcmSXfx9EIaio0fng=;
 b=LXifjZ/mWLZLJKXUG1XZqUsk1oAAJ3pVW9sAqnUn03nM32YdNrljcxEpUHsCPFO4iH
 WgGXpaVPLa4Q+eJm+c27T/IzKHrb9NqTmVq49XhlPfQuN+3/5E6eC13Zee4K82ON9D0F
 /KMoYGpj2F2nQLA8B/Zl6XoINJPwrjzRjbX/wM0wOqOX8LecLwS15XnkgGJs8EM6vo+c
 dzS5/Uvj5djmTI/pUfCdy/inviuUarpn8d2BDbBmrrRKGa0pTa64MV4EEfs/L5CERjsD
 l8sCuqhUDkubDcqIxYe75AxGYWoAfSXnvhfU8dDZNN9Orjb6LczeiVNlIFAbm7VQ+fFX
 xD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690282169; x=1690886969;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xKaUQGPjdDfYhdrv9D3r8wNt4DpcmSXfx9EIaio0fng=;
 b=St9007dENCWS6/F2dRROnHtDINJeyTpYZAoZbg+sG0tgRTkBfkJIPprOeMM56VWb3k
 TIlNJ1dwBONShpWCLS3j4bZOsLKKtM65GpGdZTKHd4CAgxn8qx8fQAmeif3LcJw09J0J
 EF0XvIl3lZy4nJxGQEhc+o4tKDleysLziAYURxNUemmXgsvuSi4zbQfKFvYYwp/i4cLI
 Z80z1hp6/0PY6SiEh75HHkSTb88wCO6F1oTvdHtah21X2Gw2YvSPvITeCgT2bDvJfu1v
 wUHTrBAP6dIW7OHvYKsg3Z/6HT8TPNMmI90hZSrEptSRiXyw9k6R+eycBPBqb5a2jotg
 G4jQ==
X-Gm-Message-State: ABy/qLalGzHk6ebeJKXjW7T8RSx9QgWIMhB9m5qr3VtUiLT2zqt1zNbl
 E9UPRlLsATL+MEMwrTxz45w=
X-Google-Smtp-Source: APBJJlFHZDa5JGiPNcdmSGdDvacm6f4uAn24FLGnr6AtF453L+WG4jkhfRjsQnNjWdBVI1BQRpG/eg==
X-Received: by 2002:a19:6755:0:b0:4f8:5bf7:db05 with SMTP id
 e21-20020a196755000000b004f85bf7db05mr7354401lfj.27.1690282168453; 
 Tue, 25 Jul 2023 03:49:28 -0700 (PDT)
Received: from akanner-r14. ([77.222.25.78]) by smtp.gmail.com with ESMTPSA id
 c20-20020a197614000000b004edc72be17csm2695943lff.2.2023.07.25.03.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 03:49:27 -0700 (PDT)
Message-ID: <64bfa8b7.190a0220.b6db7.53b7@mx.google.com>
X-Google-Original-Message-ID: <ZL+otOFR1r507Opz@akanner-r14.>
Date: Tue, 25 Jul 2023 13:49:24 +0300
From: Andrew Kanner <andrew.kanner@gmail.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 2/2] drivers: net: prevent tun_can_build_skb() to exceed
 xdp size limits
References: <20230724221326.384-1-andrew.kanner@gmail.com>
 <20230724221326.384-2-andrew.kanner@gmail.com>
 <CACGkMEt+LW8FBNwcn6f0cBwTOuKy+ZPy3Smg6fJgo9OrCUAOjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACGkMEt+LW8FBNwcn6f0cBwTOuKy+ZPy3Smg6fJgo9OrCUAOjQ@mail.gmail.com>
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

T24gVHVlLCBKdWwgMjUsIDIwMjMgYXQgMTE6Mzk6NDZBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiBUdWUsIEp1bCAyNSwgMjAyMyBhdCA2OjE14oCvQU0gQW5kcmV3IEthbm5lciA8YW5k
cmV3Lmthbm5lckBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IFRlc3RlZCB3aXRoIHN5emthbGxl
ciByZXBybyB3aXRoIHJlZHVjZWQgcGFja2V0IHNpemUuIEl0IHdhcwo+ID4gZGlzY292ZXJlZCB0
aGF0IFhEUF9QQUNLRVRfSEVBRFJPT00gaXMgbm90IGNoZWNrZWQgaW4KPiA+IHR1bl9jYW5fYnVp
bGRfc2tiKCksIGFsdGhvdWdoIHBhZCBtYXkgYmUgaW5jcmVtZW50ZWQgaW4KPiA+IHR1bl9idWls
ZF9za2IoKS4KPiA+Cj4gPiBGaXhlczogN2RmMTMyMTlkNzU3ICgidHVuOiByZXNlcnZlIGV4dHJh
IGhlYWRyb29tIG9ubHkgd2hlbiBYRFAgaXMgc2V0IikKPiA+IExpbms6IGh0dHBzOi8vc3l6a2Fs
bGVyLmFwcHNwb3QuY29tL3RleHQ/dGFnPVJlcHJvQyZ4PTEyYjI1OTNlYTgwMDAwCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgS2FubmVyIDxhbmRyZXcua2FubmVyQGdtYWlsLmNvbT4KPiA+IC0t
LQo+ID4gIGRyaXZlcnMvbmV0L3R1bi5jIHwgOCArKysrKysrLQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9uZXQvdHVuLmMgYi9kcml2ZXJzL25ldC90dW4uYwo+ID4gaW5kZXggMThjY2JiZTk4MzBh
Li5jZGYyYmQ4NWIzODMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL25ldC90dW4uYwo+ID4gKysr
IGIvZHJpdmVycy9uZXQvdHVuLmMKPiA+IEBAIC0xNTgyLDcgKzE1ODIsMTMgQEAgc3RhdGljIHZv
aWQgdHVuX3J4X2JhdGNoZWQoc3RydWN0IHR1bl9zdHJ1Y3QgKnR1biwgc3RydWN0IHR1bl9maWxl
ICp0ZmlsZSwKPiA+ICBzdGF0aWMgYm9vbCB0dW5fY2FuX2J1aWxkX3NrYihzdHJ1Y3QgdHVuX3N0
cnVjdCAqdHVuLCBzdHJ1Y3QgdHVuX2ZpbGUgKnRmaWxlLAo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaW50IGxlbiwgaW50IG5vYmxvY2ssIGJvb2wgemVyb2NvcHksIGludCAqc2ti
X3hkcCkKPiA+ICB7Cj4gPiAtICAgICAgIGlmIChTS0JfREFUQV9BTElHTihsZW4gKyBUVU5fUlhf
UEFEKSArCj4gPiArICAgICAgIGludCBwYWQgPSBUVU5fUlhfUEFEOwo+ID4gKyAgICAgICBzdHJ1
Y3QgYnBmX3Byb2cgKnhkcF9wcm9nID0gcmN1X2RlcmVmZXJlbmNlKHR1bi0+eGRwX3Byb2cpOwo+
IAo+IFRoaXMgbWlzc2VzIHJjdSByZWFkIGxvY2suCj4gCj4gSSB3b25kZXIgaWYgdGhpbmdzIGNv
dWxkIGJlIHNpbXBsZXIgaWYgd2UgbW92ZSB0aGUgbGltaXQgY2hlY2sgZnJvbQo+IHR1bl9jYW5f
YnVpbGRfc2tiKCkgdG8gdHVuX2J1aWxkX3NrYigpOgo+IAo+IHJjdV9yZWFkX2xvY2soKTsKPiB4
ZHBfcHJvZyA9IHJjdV9kZXJlZmVyZW5jZSh0dW4tPnhkcF9wcm9nKTsKPiAgICAgICAgIGlmICh4
ZHBfcHJvZykKPiAgICAgICAgICAgICAgICAgcGFkICs9IFhEUF9QQUNLRVRfSEVBRFJPT007Cj4g
YnVmbGVuICs9IFNLQl9EQVRBX0FMSUdOKGxlbiArIHBhZCk7Cj4gcmN1X3JlYWRfdW5sb2NrKCk7
Cj4gCj4gVGhhbmtzCj4gCgpUaGFua3MsIEkgbWlzc2VkIHRoZSBwYXJ0IHdpdGggcmN1IHJlYWQg
bG9jayBmb3Igc29tZSByZWFzb24uCgpJdCdzIGEgZ29vZCBpZGVhIHRvIG1vdmUgLyByZWR1Y2Ug
ZHVwbGljYXRpb24uIExldCBtZSB0aGluayBhbmQgdHJ5IHRvCmZpeCBhY2NvcmRpbmcgdG8geW91
ciBjb21tZW50cywgSSB3aWxsIHJlc2VuZCBpdCBhcyB2Mi4KCi0tIApBbmRyZXcgS2FubmVyCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5l
bC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
