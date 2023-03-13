Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FC8C6FD19
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Mar 2023 14:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47C5D81951;
	Mon, 13 Mar 2023 14:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47C5D81951
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JsYGpUuu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LkgY0-f252sJ; Mon, 13 Mar 2023 14:29:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0428A8191E;
	Mon, 13 Mar 2023 14:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0428A8191E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF258C0035;
	Mon, 13 Mar 2023 14:29:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70543C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 14:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 378B941729
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 14:29:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 378B941729
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20210112 header.b=JsYGpUuu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JKkFv4XUJseY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 14:29:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B06141718
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B06141718
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 14:29:48 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-5416b0ab0ecso116031197b3.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 07:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678717788;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6UKWk2lA6kcgmQW/mPXhYLF0VgpMqFYUu2eJawxBUrc=;
 b=JsYGpUuuAx69bskMhPRqv35bAcYWS/hoIYaRo9DNZLzgl1Utp9qht4TTGAWdAQEbsf
 5UJxIBxJssi4Lqs01bKzAvX+MoGXit5rRaXgLxkVgnN7f1AED9uIfPAzCz/xZt8tAsm9
 mRZ3BawbmCm60zy91wZNRV3xPR1z6mLAakuqOfsEuT7clGpdo3KFgVwtliPaCU51V4qt
 EO4UrVB21S99Syng0gy+sj3NTmwckTm9oIL4bYv+iLzA4WqxAYRLZCYJvVO/6Ns3iG2P
 9OXop6CzXqYhlm1cmJ0ZBPc05a7i0r9lPDskicKJwOrW/LyFCtYmHaJrKqKjW0/HKsYp
 K7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678717788;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6UKWk2lA6kcgmQW/mPXhYLF0VgpMqFYUu2eJawxBUrc=;
 b=fKFqTG+lwPOe66JpTkEEGNuBsexT5AQ/UlEvCJ6aeWD64wMfloFNllAMb+rR4NN8X+
 2YB2BQr1UIkmOaxLIDlj+iH4Cv5KCuBIV697bfq/RMgusCrC/2512pvIGGvXeIzVp3bb
 zJpltF40ZNaPtUwGk+4OVE/kAcFf+q3iyhVgrVuarWf/p3Kl+LxMdEfAXdvFaWu6z/FQ
 jJCWAmMZPy+3HJP3opFRY2PRTDrf6jC3/Y4c+rJ3D+SG3pR3bKluxxlvjqyVW7AwO3X3
 67ZLOLdWjMQ9xmPqTSMMipjw82ipkQUIpI2ryEWbA26HCWS4TZ/oYQUU4LVuF8IsBZAX
 JqwA==
X-Gm-Message-State: AO0yUKV1ddtRcfxHSlTExqnJPDLisqcx7qMDkwEb5VYP2/zzJPYspxYs
 Rl3ibU2eVNuG3zmn/kzZJvtQcYiUlNEyuBtB+ELYnQ==
X-Google-Smtp-Source: AK7set9+V74KeSz36D//IGW89NODCNRrVm8ctZWGiYSP3DdxCEfiOrL/e5qwPAaaztWcNGEAHyWBdw2UyDWyJW43tQ8=
X-Received: by 2002:a81:a989:0:b0:534:1d7:fcf0 with SMTP id
 g131-20020a81a989000000b0053401d7fcf0mr22797541ywh.1.1678717787629; Mon, 13
 Mar 2023 07:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230312224250.425727-1-vincenzopalazzodev@gmail.com>
 <20230312175703.d8d8e0192387dfa9592ee8e5@linux-foundation.org>
 <CR55BD4YCDR1.22R5TLYJW6YS0@vincent-arch>
In-Reply-To: <CR55BD4YCDR1.22R5TLYJW6YS0@vincent-arch>
Date: Mon, 13 Mar 2023 07:29:35 -0700
Message-ID: <CAJuCfpETYdLRigLTHe6HHQrC5vy5MmDc=HPsuMc6UKEzfr22ZA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/1] linux: mm_types: allow to modified the
 vm_flags in vm_area_struct
To: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Cc: david@redhat.com, jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
 Liam.Howlett@oracle.com, jgg@ziepe.ca, willy@infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
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
From: Suren Baghdasaryan via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Suren Baghdasaryan <surenb@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gTW9uLCBNYXIgMTMsIDIwMjMgYXQgMjoyNeKAr0FNIFZpbmNlbnpvIFBhbGF6em8KPHZpbmNl
bnpvcGFsYXp6b2RldkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uIE1hciAxMywgMjAyMyBh
dCAxOjU3IEFNIENFVCwgQW5kcmV3IE1vcnRvbiB3cm90ZToKPiA+IE9uIFN1biwgMTIgTWFyIDIw
MjMgMjM6NDI6NTAgKzAxMDAgVmluY2Vuem8gUGFsYXp6byA8dmluY2Vuem9wYWxhenpvZGV2QGdt
YWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gPiBXaXRoIDYuMy1yYzEgaXMgbm90IHBvc3NpYmxlIHRv
IGJ1aWxkIHRoZSBmb2xsb3dpbmcgZHJpdmVycwo+ID4KPiA+IFdlbGwsIGxldCdzIGNjIFN1cmVu
IHdobyBhY3R1YWxseSB3cm90ZSBiYzI5MmFiMDBmNmMgKCJtbTogaW50cm9kdWNlCj4gPiB2bWEt
PnZtX2ZsYWdzIHdyYXBwZXIgZnVuY3Rpb25zIikuCj4gPgo+ID4gPiAtIG52aWRpYSwgdGhhdCB0
aGUgY29tcGlsYXRpb24gcmV0dXJucyB0aGUgZm9sbG93aW5nIGVycm9ycwo+ID4gPgo+ID4gPiAt
IHZib3hob3N0LzcuMC42X09TRSB3aGVyZSB0aGUgYnVpbGQgZmFpbHMgd2l0aCB0aGUgZm9sbG93
aW5nIGVycm9ycwo+ID4gPgo+ID4gPiAuLi4KPiA+ID4KPiA+ID4gLS0tIGEvaW5jbHVkZS9saW51
eC9tbV90eXBlcy5oCj4gPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvbW1fdHlwZXMuaAo+ID4gPiBA
QCAtNDk3LDcgKzQ5Nyw3IEBAIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCB7Cj4gPiA+ICAgICAgKiBU
byBtb2RpZnkgdXNlIHZtX2ZsYWdzX3tpbml0fHJlc2V0fHNldHxjbGVhcnxtb2R9IGZ1bmN0aW9u
cy4KPiA+ID4gICAgICAqLwo+ID4gPiAgICAgdW5pb24gewo+ID4gPiAtICAgICAgICAgICBjb25z
dCB2bV9mbGFnc190IHZtX2ZsYWdzOwo+ID4gPiArICAgICAgICAgICB2bV9mbGFnc190IHZtX2Zs
YWdzOwo+ID4gPiAgICAgICAgICAgICB2bV9mbGFnc190IF9fcHJpdmF0ZSBfX3ZtX2ZsYWdzOwo+
ID4gPiAgICAgfTsKPiA+Cj4gPiBUaGVzZSBvdXQtb2YtdHJlZSBkcml2ZXJzIHNob3VsZCBiZSBj
b252ZXJ0ZWQgdG8gdXNlIHRoZSB3cmFwcGVycyB3aGljaAo+ID4gYmMyOTJhYjAwZjZjIGFkZGVk
LiAgVGhlaXIgbWFpbnRhaW5lcnMgaGF2ZSBhIGNvdXBsZSBvZiBtb250aHMgdG8gZG8KPiA+IHRo
aXMgYmVmb3JlIGJjMjkyYWIwMGY2YyBpcyByZWxlYXNlZCBpbiA2LjMuCj4KPiBZZWFoIEkgdGhv
dWdodCBhYm91dCB0aGF0ISBudmlkaWEgdXBkYXRlIGFzIHNvb24gYXMgdGhlIDYuMyBpcyBvdXQs
IG5vdCBzdXJlCj4gYWJvdXQgdmJveGhvc3QuIEJ1dCBsZXQgdGhlIGRyaXZlciB1cGRhdGUgdG8g
dGhpcyBuZXcgZmVhdHVyZSBtYWtlIHNlbnNlLgo+Cj4gPgo+ID4gSXQncyB1bmZvcnR1bmF0ZS4g
IEkgZ3Vlc3MgaXQgd291bGQgYmUgYmV0dGVyIGlmIHdlIHdlcmUgdG8gZmluZCBhIHdheQo+ID4g
dG8gcGVybWl0IHRoZXNlIGRyaXZlcnMgdG8gY29tcGlsZSBPSyBidXQgdG8gZ2VuZXJhdGUgd2Fy
bmluZ3MsIGFzIGFuCj4gPiBpbnRlcmltIHRoaW5nIGZvciBzaXggbW9udGhzIG9yIHNvLiAgUGVy
aGFwcyB0aGVyZSdzIHNvbWUgY2xldmVyIHdheS4KPgo+IFllYWggaXQgaXMhIFJlZ2FyZGluZyBn
aXZpbmcgdGhlIHBvc3NpYmxpdHkgdG8gY29tcGlsZSBvayAoYW5kCj4gcHJlc2VydmluZyB0aGUg
cHJldmlvdXMgYmVoYXZpb3IpIGxvb2sgbGlrZSBhbiBpbnRlcmVzdGluZyB0aG91Z2h0IGZvcgo+
IGtlcm5lbCBBUEksIGJ1dCBhbSBJIHRoaW5rIHRoYXQgaXQgdGhpcyBpcyBkaWZmaWN1bHQgdG8g
ZG8/Cj4KPiBUaGUgcmVhbCB0aGluZ3MgdGhhdCBJJ20gbWlzc2luZyB3aXRoIHRoZSBuZXcgd3Jh
cHBlciBBUEkKPiBpcyB0aGUgbWVhbmluZyBvZiB0aGUgbmV3IGB2bV9mbGFnc190IHZtX2ZsYWdz
YCwgYmVmb3JlIHRoZQo+IGZpZWxkIHdhcyBvbmx5IG9uZSBhbmQgaXQgd2FzIGdldHRpbmcgbW9k
aWZpZWQsIGJ1dCBub3cgdGhlIHJlYWwKPiB2YWx1ZSBpcyB0aGUgcHJpdmF0ZSBvbmUgYF9fdm1f
ZmxhZ3NgLCBzbyB3aGF0IGlzIHRoZSBtZWFuaW5nIG9mCj4gdGhlIG5ldyBgdm1fZmxhZ3NgPwoK
U29ycnkgZm9yIHRoZSBkZWxheS4gSSdtIG9uIHZhY2F0aW9uIHVudGlsIFdlZG5lc2RheSBhbmQg
aGF2ZSBsaW1pdGVkCm5ldHdvcmsgYWNjZXNzLgp2bV9mbGFncyBpcyB1c2VkIGFzIGEgcmVhZC1v
bmx5IHByb3BlcnR5IHNvIHRoYXQgcmVhZGVycyBvZiB0aGUgZmxhZ3MKZG9uJ3QgaGF2ZSB0byBj
aGFuZ2UsIGhvd2V2ZXIgZmxhZyBtb2RpZmllcnMgc2hvdWxkIGJlIHVzaW5nIG5ldwp3cmFwcGVy
IGZ1bmN0aW9ucy4gRml4aW5nIHRoZSBlcnJvcnMgaW4gdGhpcyByZXBvcnQgc2hvdWxkIGJlIHRy
aXZpYWwuCkZvciBleGFtcGxlOgp2bWEtPnZtX2ZsYWdzIHw9IFZNX0lPIHwgVk1fUEZOTUFQIHwg
Vk1fRE9OVEVYUEFORDsKc2hvdWxkIGJlIHJlcGxhY2VkIHdpdGgKdm1fZmxhZ3Nfc2V0KHZtYSwg
Vk1fSU8gfCBWTV9QRk5NQVAgfCBWTV9ET05URVhQQU5EKTsKYW5kCnZtYS0+dm1fZmxhZ3MgJj0g
flZNX01BWVdSSVRFOwp3aXRoCnZtX2ZsYWdzX2NsZWFyKHZtYSwgVk1fTUFZV1JJVEUpOwoKVGhh
bmtzLApTdXJlbi4KCj4KPiBJIGZlZWwgdGhhdCB0aGlzIHF1ZXN0aW9uIGlzIHN0dXBpZCBidXQg
SSBjYW4gbm90IGF2b2lkIGRvIGl0LCBvdGhlcndpc2UKPiBteSBtaW5kIHRoaW5rIGFib3V0IGl0
IHRpbGwgSSB3aWxsIG5vdCBmaW5kIGFuIGFuc3dlciA6KQo+Cj4gUC5TOiByZWdhcmluZyB0aGUg
d2FybmluZyBhdCBjb21waWxlIHRpbWUgdGhlIF9fZGVwcmVjYXRlZCBsb29rcyBhIGdvb2QKPiBm
aXQgdG8gZ2VuZXJhdGUgZXJyb3IgbWVzc2FnZSwgYnV0IHRvIG1lIGluIHRoaXMgcGFydGljdWxh
ciBjYXNlIGRvIG5vdC4KPgo+IFRoYW5rcywKPgo+IFZpbmNlbnQuCj4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFp
bGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
a2VybmVsLW1lbnRlZXMK
