Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAFDCE79D3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Sep 2023 13:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1BAC4194A;
	Wed, 20 Sep 2023 13:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1BAC4194A
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WZzjUEDH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lFLFxx8DT0Rv; Wed, 20 Sep 2023 13:29:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 19A484192E;
	Wed, 20 Sep 2023 13:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19A484192E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0E49C0071;
	Wed, 20 Sep 2023 13:29:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A1F5C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Sep 2023 13:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 535094193A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Sep 2023 13:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 535094193A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vzo16TJE1Dy4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Sep 2023 13:29:52 +0000 (UTC)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EB3D4192E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Sep 2023 13:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EB3D4192E
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3a9b41ffe12so4656413b6e.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Sep 2023 06:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695216591; x=1695821391;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vVWGEgGSEjp4k+KXLV/K8fcEJkhuenia706z3qiQLdM=;
 b=WZzjUEDH33ZNos97Rz3J/ayMm3sTNlLnOFfm0KnGjK2oKuXblejPM0EN1vTII7C2Cj
 4m2MfQ5QovD9KC7lcqNs3qTf7qjOTxqubCWb250+fbe+nRxYL/SmWXW6djl/cpUVxKKD
 XKO2DSlmkQWY9g5GmcG/KimGTlcrErDpqy6xnxv7TffkQd7ert4RWbuup7uNSG22qobO
 NK9p3dzaf4mzYp9FSrEEp6CCeKu0oUrQST1775fiMjzCyZXojY+VSN1/R6K7VLnUGbVR
 d9Cknsbh2/U0nfa28SD385/eYsBKJtQqpl1FVjEdwY+YvS3QSrWTHArdpBKY+QkHTGru
 a8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695216591; x=1695821391;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vVWGEgGSEjp4k+KXLV/K8fcEJkhuenia706z3qiQLdM=;
 b=DMeIXG3bo7tsMD4Bu7+TBL9RUfU2HVwqLVVDmaQr7Owv8IUgFJanKqsV+rhnmb6n6n
 F8s+i/rm9fnYV4NH0yIG4pUpZefd0wRns7GdYPw30P+KbdiyFTNoL4XrBM1D4biqj6k2
 rb8PXf5Z1WVbhOlfJBL2w8iQ5beQIcT7GrAgw1AQTO3IAAPbNH+H7wgEbp62sYI1TDxz
 5BoIF3c4OHWMbDiGBZe7NQIf5uMKYqX7N1Mynxe3R1zxAYF3IEzyNGGuTn08m5GceKDX
 tGljjvH3S1+qq73Td8DWOMebp2x+7gUq6l/0xSLvpbfgiQtDCUnsa6ksUOy8Rj3t8Lh6
 03zg==
X-Gm-Message-State: AOJu0YzDvScV88sR68Oc2JTFjqFBQdRehM9Gb2qtm0JT/x8D2FQ+0ABi
 Ow9IsBmDccrOUoVEGdMguD6yC1RvzGLHKcTONDw=
X-Google-Smtp-Source: AGHT+IF/BUd8MrJluzuOw7ioQsv1V6pvR5BavSSty4c1W5OmAuN4YZx6qQ/56UFJNwajEHtJFgc8XNtg6sya/8m/39A=
X-Received: by 2002:a05:6870:4248:b0:1d6:6941:d1d0 with SMTP id
 v8-20020a056870424800b001d66941d1d0mr2513289oac.49.1695216591341; Wed, 20 Sep
 2023 06:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230919093318.16407-1-swarupkotikalapudi@gmail.com>
 <e1294905-b867-4141-87ff-2b7202476e59@infradead.org>
In-Reply-To: <e1294905-b867-4141-87ff-2b7202476e59@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 20 Sep 2023 09:29:40 -0400
Message-ID: <CADnq5_Oy=f9aQDX0VE7vE0brU3sLe08zWDukcRPBEyfhdUKUHw@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: amd: display: fix kernel-doc warnings
To: Randy Dunlap <rdunlap@infradead.org>
Cc: sunpeng.li@amd.com, airlied@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, alexander.deucher@amd.com,
 Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>,
 harry.wentland@amd.com, christian.koenig@amd.com,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

QXBwbGllZC4gIFRoYW5rcyEKCk9uIFR1ZSwgU2VwIDE5LCAyMDIzIGF0IDU6NTTigK9QTSBSYW5k
eSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIDkv
MTkvMjMgMDI6MzMsIFN3YXJ1cCBMYXhtYW4gS290aWFrbGFwdWRpIHdyb3RlOgo+ID4gRml4IGtl
cm5lbC1kb2Mgd2FybmluZ3MgZGlzY292ZXJlZCBpbiBBTUQgZ3B1IGRpc3BsYXkgZHJpdmVyLgo+
ID4gRml4ZXMgdGhlc2Ugd2FybmluZ3M6Cj4gPiAuL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9pbmMvaHcvbXBjLmg6MTEwOiB3YXJuaW5nOgo+ID4gRnVuY3Rpb24gcGFyYW1ldGVyIG9y
IG1lbWJlciAnb3ZlcmxhcF9vbmx5Jwo+ID4gbm90IGRlc2NyaWJlZCBpbiAnbXBjY19ibG5kX2Nm
ZycuCj4gPgo+ID4gLi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L21wYy5o
OjExMDogd2FybmluZzoKPiA+IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2JvdHRvbV9n
YWluX21vZGUnCj4gPiBub3QgZGVzY3JpYmVkIGluICdtcGNjX2JsbmRfY2ZnJy4KPiA+Cj4gPiAu
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvbXBjLmg6MTEwOiB3YXJuaW5n
Ogo+ID4gRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnYmFja2dyb3VuZF9jb2xvcl9icGMn
Cj4gPiBub3QgZGVzY3JpYmVkIGluICdtcGNjX2JsbmRfY2ZnJy4KPiA+Cj4gPiAuL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvbXBjLmg6MTEwOgo+ID4gd2FybmluZzogRnVu
Y3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAndG9wX2dhaW4nCj4gPiBub3QgZGVzY3JpYmVkIGlu
ICdtcGNjX2JsbmRfY2ZnJy4KPiA+Cj4gPiAuL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9pbmMvaHcvbXBjLmg6MTEwOgo+ID4gd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1l
bWJlciAnYm90dG9tX2luc2lkZV9nYWluJwo+ID4gbm90IGRlc2NyaWJlZCBpbiAnbXBjY19ibG5k
X2NmZycuCj4gPgo+ID4gLi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L21w
Yy5oOjExMDoKPiA+IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2JvdHRv
bV9vdXRzaWRlX2dhaW4nCj4gPiBub3QgZGVzY3JpYmVkIGluICdtcGNjX2JsbmRfY2ZnJy4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTd2FydXAgTGF4bWFuIEtvdGlha2xhcHVkaSA8c3dhcnVwa290
aWthbGFwdWRpQGdtYWlsLmNvbT4KPgo+IFRoYW5rcyBmb3IgZml4aW5nIHRoZXNlIGtlcm5lbC1k
b2Mgd2FybmluZ3MuCj4KPiBUZXN0ZWQtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRl
YWQub3JnPgo+IEFja2VkLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4K
Pgo+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L21w
Yy5oIHwgNiArKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvbXBj
LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L21wYy5oCj4gPiBpbmRl
eCA4ZDg2MTU5ZDlkZTAuLjYxYTI0MDZkY2M1MyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvbXBjLmgKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvbXBjLmgKPiA+IEBAIC05MSw2ICs5MSwxMiBAQCBlbnVt
IG1wY2NfYWxwaGFfYmxlbmRfbW9kZSB7Cj4gPiAgICogQGdsb2JhbF9nYWluOiB1c2VkIHdoZW4g
YmxlbmQgbW9kZSBjb25zaWRlcnMgYm90aCBwaXhlbCBhbHBoYSBhbmQgcGxhbmUKPiA+ICAgKiBh
bHBoYSB2YWx1ZSBhbmQgYXNzdW1lcyB0aGUgZ2xvYmFsIGFscGhhIHZhbHVlLgo+ID4gICAqIEBn
bG9iYWxfYWxwaGE6IHBsYW5lIGFscGhhIHZhbHVlCj4gPiArICogQG92ZXJsYXBfb25seTogd2hl
dGhlciBvdmVybGFwcGluZyBvZiBkaWZmZXJlbnQgcGxhbmVzIGlzIGFsbG93ZWQKPiA+ICsgKiBA
Ym90dG9tX2dhaW5fbW9kZTogYmxlbmQgbW9kZSBmb3IgYm90dG9tIGdhaW4gc2V0dGluZwo+ID4g
KyAqIEBiYWNrZ3JvdW5kX2NvbG9yX2JwYzogYmFja2dyb3VuZCBjb2xvciBmb3IgYnBjCj4gPiAr
ICogQHRvcF9nYWluOiB0b3AgZ2FpbiBzZXR0aW5nCj4gPiArICogQGJvdHRvbV9pbnNpZGVfZ2Fp
bjogYmxlbmQgbW9kZSBmb3IgYm90dG9tIGluc2lkZQo+ID4gKyAqIEBib3R0b21fb3V0c2lkZV9n
YWluOiAgYmxlbmQgbW9kZSBmb3IgYm90dG9tIG91dHNpZGUKPiA+ICAgKi8KPiA+ICBzdHJ1Y3Qg
bXBjY19ibG5kX2NmZyB7Cj4gPiAgICAgICBzdHJ1Y3QgdGdfY29sb3IgYmxhY2tfY29sb3I7ICAg
IC8qIGJhY2tncm91bmQgY29sb3IgKi8KPgo+IC0tCj4gflJhbmR5Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxp
bmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtl
cm5lbC1tZW50ZWVzCg==
