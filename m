Return-Path: <SRS0=w7vp=DN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B3DC4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 04:23:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 222BA206F4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 04:23:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ubeQDXA0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 222BA206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9FEDC86FA1;
	Tue,  6 Oct 2020 04:23:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LJMnZjPds0nU; Tue,  6 Oct 2020 04:23:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E3AAB86F63;
	Tue,  6 Oct 2020 04:23:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C840CC016F;
	Tue,  6 Oct 2020 04:23:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D6C2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 04:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 43B83838CD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 04:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wJUH475C5tGh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 04:23:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 65EFF82D8E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 04:23:25 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id 16so3594225oix.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 05 Oct 2020 21:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ANwFhziA6NRWy7lZW13LCK/3C4mrNKWe01LnUy/PyPE=;
 b=ubeQDXA0Cxgx/7bsZrkCxUu/6MyXungEnZFJh68eu2VOKv2s62eO/QDVQwlfjlA2/y
 yZVEYLo1pgOebppHxYSjR3kZGHGr06j82PPJWb686YC/YKIBKsUcld2rw7JLfG4JDItw
 G7EamMDZgIYjasgdCxQ4ctLYbcniFRDkwpumD5YqGplcmwvSxQRG3EzMz6N7mB4y02lw
 ZZ83xUduJh3zyyCTvbxUOoyQdG6Gc5XmPLySGddsHD9QUS+FctDCLUJo5H+2bnd7Az8M
 Wvq3NbBy/T3t42RHf8OJ0pPWcDVacw7lLYgdYLT0sUSmmUHMvtg3DbATYd6fmueho05w
 xHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ANwFhziA6NRWy7lZW13LCK/3C4mrNKWe01LnUy/PyPE=;
 b=F5BhWBFT4henT2Ppvd7PrZMzhPzSTJU3haWLkmASKnS3CTH34X/qplxyW3H+CeEvQT
 ZGvOZ1RWhNOvPTQPhQF/sBh9g8FM7rG4qRXKcQh9Tpp1kX2oV1NiWQTWVyPB7747CZEB
 8zHGb2m4KoJaOkNsCBNtQBt9FEYbmjfSuRqJZs7rwEBMCaW0O1xXfO651pSNhPIgiZOc
 JT7//m4RFKGHmxFTS+Kga1A+3IQk+GSO48368+lZScIov2sDBgiGqvhfxPCs8VE5dSq/
 wvT5tnsI1s2910GucYYu0Sa8kg92uBTEVs7LQUJSleYA/IOzq1GWYFYUtfsFd2LJ1/te
 LIHg==
X-Gm-Message-State: AOAM532BPfTcVTa4v08jiLoaHCCVIBs2tGmdTqvKIIxRJML+NrvbDliq
 52J7C74g01Pm+5mlnh6gefaT3z3vLJm5dy0AJJc=
X-Google-Smtp-Source: ABdhPJw+GnvJSuib5NZuUVCEofN25qGMWIfm6hYEVa4I/0D7Ei5FiW4+DLQ7RPRKVLx3zTga+m/WOUE/ce5/0AQqPJE=
X-Received: by 2002:aca:ea44:: with SMTP id i65mr1536012oih.117.1601958204442; 
 Mon, 05 Oct 2020 21:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201005192409.192317-1-dwaipayanray1@gmail.com>
 <1d8396cb33b33c3d0107ba701b7e597041dfdbc2.camel@perches.com>
 <CABJPP5DDmurU9c2qCoJcg7hvwnkYo4LCx+TW6xKG2G23Uf_Cxw@mail.gmail.com>
 <c1ca28e77e8e3bfa7aadf3efa8ed70f97a9d369c.camel@perches.com>
In-Reply-To: <c1ca28e77e8e3bfa7aadf3efa8ed70f97a9d369c.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 6 Oct 2020 09:53:01 +0530
Message-ID: <CABJPP5AmvDPFQhWfxC8TA7SCGtwzurVykR5mtPx0ytm-PJDmYA@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add new warnings
	to author signoff checks.
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

T24gVHVlLCBPY3QgNiwgMjAyMCBhdCAyOjM5IEFNIEpvZSBQZXJjaGVzIDxqb2VAcGVyY2hlcy5j
b20+IHdyb3RlOgo+Cj4gT24gVHVlLCAyMDIwLTEwLTA2IGF0IDAxOjM3ICswNTMwLCBEd2FpcGF5
YW4gUmF5IHdyb3RlOgo+ID4gT24gVHVlLCBPY3QgNiwgMjAyMCBhdCAxOjA3IEFNIEpvZSBQZXJj
aGVzIDxqb2VAcGVyY2hlcy5jb20+IHdyb3RlOgo+ID4gPiBPbiBUdWUsIDIwMjAtMTAtMDYgYXQg
MDA6NTQgKzA1MzAsIER3YWlwYXlhbiBSYXkgd3JvdGU6Cj4gPiA+ID4gVGhlIGF1dGhvciBzaWdu
ZWQtb2ZmLWJ5IGNoZWNrcyBhcmUgY3VycmVudGx5IHZlcnkgdmFndWUuCj4gPiA+ID4gQ2FzZXMg
bGlrZSBzYW1lIG5hbWUgb3Igc2FtZSBhZGRyZXNzIGFyZSBub3QgaGFuZGxlZCBzZXBhcmF0ZWx5
Lgo+ID4gPgo+ID4gPiBXaGVuIHlvdSBydW4gdGVzdHMgZm9yIHRoaXMsIGhvdyBtYW55IG1pc21h
dGNoZXMgYXJlCj4gPiA+IGNhdXNlZCBieSBuYW1lIGZvcm1hdHRpbmcgY2hhbmdlcyBsaWtlOgo+
ID4gPgo+ID4gPiBGcm9tOiAiRGV2ZWxvcGVyLCBKLiBSYW5kb20iIDxqcmRAYmlnY29ycC5jb20+
Cj4gPiA+IC4uLgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiAiSi4gUmFuZG9tIERldmVsb3BlciIgPGpy
ZEBiaWdjb3JwLmNvbT4/Cj4gPiA+Cj4gPiA+IFNob3VsZCB0aGVzZSBkaWZmZXJlbmNlcyBnZW5l
cmF0ZSBhIHdhcm5pbmc/Cj4gPiA+Cj4gPgo+ID4gSGksCj4gPiBJIHJhbiBteSB0ZXN0cyBvbiBu
b24gbWVyZ2UgY29tbWl0cyBiZXR3ZWVuIHY1LjcgYW5kIHY1LjguCj4gPgo+ID4gVGhlcmUgd2Vy
ZSBhIHRvdGFsIG9mIDI1MCBOT19BVVRIT1JfU0lHTl9PRkYgV2FybmluZ3MKPiA+Cj4gPiAyMDMg
b2YgdGhlc2Ugd2VyZSBlbWFpbCBhZGRyZXNzIG1pc21hdGNoZXMuCj4gPiAzMiBvZiB0aGVzZSB3
ZXJlIG5hbWUgbWlzbWF0Y2hlcy4KPiA+Cj4gPiBTbyBmb3IgdGhlIG5hbWUgbWlzbWF0Y2hlcywg
dGhlIHR5cGljYWwgY2FzZXMgYXJlIGxpa2U6Cj4gPgo+ID4gJ0Zyb206IHRhbm5lcmxvdmUgPHRh
bm5lcmxvdmVAZ29vZ2xlLmNvbT4nICE9ICdTaWduZWQtb2ZmLWJ5OiBUYW5uZXIKPiA+IExvdmUg
PHRhbm5lcmxvdmVAZ29vZ2xlLmNvbT4nCj4gPiAnRnJvbTogIuacseeBv+eBvyIgPHpodWNhbmNh
bkB2aXZvLmNvbT4nICE9ICdTaWduZWQtb2ZmLWJ5OiB6aHVjYW5jYW4KPiA+IDx6aHVjYW5jYW5A
dml2by5jb20+Jwo+ID4gJ0Zyb206IFl1dmFsIEJhc3NvbiA8eWJhc29uQG1hcnZlbGwuY29tPicg
IT0gJ1NpZ25lZC1vZmYtYnk6IFl1dmFsCj4gPiBCYXNvbiA8eWJhc29uQG1hcnZlbGwuY29tPicK
PiA+ICdGcm9tOiBhbGxlbiA8YWxsZW4uY2hlbkBpdGUuY29tLnR3PicgIT0gJ1NpZ25lZC1vZmYt
Ynk6IEFsbGVuIENoZW4KPiA+IDxhbGxlbi5jaGVuQGl0ZS5jb20udHc+Jwo+ID4KPiA+IEkgZGlk
bid0IGZpbmQgdGhlIGV4YWN0IGZvcm1hdHRpbmcgY2hhbmdlIHlvdSBtZW50aW9uZWQgaW4gbXkg
Y29tbWl0IHJhbmdlLgo+ID4gQnV0IEkgZGlkIGZpbmQgc29tZXRoaW5nIGxpa2U6Cj4gPgo+ID4g
J0Zyb206ICJQYXVsIEEuIENsYXJrZSIgPHBjQHVzLmlibS5jb20+JyAhPSAnU2lnbmVkLW9mZi1i
eTogUGF1bAo+ID4gQ2xhcmtlIDxwY0B1cy5pYm0uY29tPicKPiA+Cj4gPiBTbyBpdCdzIGxpa2Ug
c29tZSBoYXZlIHBhcnRzIG9mIHRoZWlyIG5hbWVzIHJlbW92ZWQsIHNvbWUgaGF2ZSBsYW5ndWFn
ZQo+ID4gY29uZmxpY3RzLCBhbmQgeWV0IHNvbWUgaGF2ZSB3ZWxsIGRpZmZlcmVudCBzcGVsbGlu
Z3MsIG9yIGluaXRpYWxzLAo+ID4gZXRjLiBJdCdzIGxpa2UKPiA+IGEgd2lkZSB2YXJpZXR5IG9m
IHRoaW5ncyBoYXBwZW5pbmcgaGVyZS4KPiA+Cj4gPiBJIHRoaW5rIGNvbnNpZGVyaW5nIHRoZXNl
LCBpdCBzaG91bGQgYmUgd2FybmVkIGFib3V0LCBhbmQgbGV0IHBlb3BsZSBrbm93Cj4gPiB0aGF0
IHRoZXJlIG1pZ2h0IGJlIHNvbWV0aGluZyB3cm9uZyBnb2luZyBvbi4KPiA+Cj4gPiBXaGF0IGRv
IHlvdSB0aGluaz8KPgo+IEV4Y2VwdCBmb3IgY29tbWVudHMgYW5kIHF1b3RlcyBsaWtlOgo+Cj4g
ICAgICAgICBGcm9tOiBKLiBSYW5kb20gRGV2ZWxvcGVyIChCaWdDb3JwKSA8anJkQGJpZ2NvcnAu
Y29tPgo+ICAgICAgICAgU2lnbmVkLW9mZi1ieTogIkouIFJhbmRvbSBEZXZlbG9wZXIiIDxqcmRA
YmlnY29ycC5jb20+Cj4KPiBJIHRoaW5rIGFueSB0aW1lIHRoZXJlJ3MgYSBtaXNtYXRjaCwgdGhl
cmUKPiBzaG91bGQgYmUgYSB3YXJuaW5nIGVtaXR0ZWQuCj4KPiBUaGF0IGluY2x1ZGVzIGFueSBz
dWJhZGRyZXNzIGRldGFpbCBkaWZmZXJlbmNlLgo+Cj4KSGksClllYWggdGhlc2UgY2FzZXMgYXJl
IGJlaW5nIGhhbmRsZWQuCgpDb21tZW50cyBhbmQgcXVvdGVzIGRvbid0IGdlbmVyYXRlIGFueSB3
YXJuaW5nIG1lc3NhZ2UgYnV0CmFsbCB0aGUgb3RoZXIgbWlzbWF0Y2hlcyBkby4KCk9ubHkgdGhl
IGNoZWNrIGZvciBzdWJhZGRyZXNzIGdlbmVyYXRlcyBhIC0tc3RyaWN0IGNoZWNrIG1lc3NhZ2Uu
Cm90aGVycyBhcmUgYWxsIFdBUk4gbWVzc2FnZXMuIEl0IHdhcyBmb2xsb3dlZCBmcm9tIG91ciBk
aXNjdXNzaW9uIGF0Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWtlcm5lbC1tZW50ZWVz
LzdiNTJlMDg1ZjBiNjlhZDE3NDI5NjZmOGVhY2QwMmRlYjkyOTliOTYuY2FtZWxAcGVyY2hlcy5j
b20vCgpTbyBkb2VzIGl0IG5lZWQgdG8gYmUgY2hhbmdlZCB0byBhIFdBUk4gb3IgaXMgaXQgZmlu
ZSBsaWtlIHRoYXQ/CgpUaGFua3MsCkR3YWlwYXlhbi4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0
CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1l
bnRlZXMK
