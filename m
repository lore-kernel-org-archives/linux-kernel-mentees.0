Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272EEC77B7C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 May 2023 11:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89F8E615A9;
	Wed, 10 May 2023 11:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89F8E615A9
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=iqcXJrve
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NgcDe6mSaZ3I; Wed, 10 May 2023 11:16:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 51C6B60BE7;
	Wed, 10 May 2023 11:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51C6B60BE7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28862C0037;
	Wed, 10 May 2023 11:16:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C693C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 11:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69D62613A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 11:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69D62613A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TJDelE7RaIa1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 11:16:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FFC660BE7
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FFC660BE7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 11:16:26 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f417ea5252so32019515e9.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 04:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683717384; x=1686309384;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pBsIndB/0JBmV2qr33mCTEeeS4Iy2jxh4GLVwKZXMKo=;
 b=iqcXJrveVHEU+GGtZG8f4wqg4YspiZKIHvie8TtfVwGgTD3tvMR0xvGhZZ+HoWynG1
 tiWh37AR3cI3KXwzfwrmATe8liUZzPRsaQLrv9r3X6DcTCVriQERbmMMBZGgl/7kcokv
 ZTmlvGG/OnxLo/bHNt58wE8sPHrH517gvo60eesWA/laL4yfQWxrhP8K23wwBsqFP/eS
 e3JNZjcp39c37KFewemN05oTv2E3O2YfBbIG8ZA+6YohNs8VXkFR+MlEo2UiYcS7z1E3
 6Fb8VqHQEPXdWhcLUA6EMPTN/ycQSFiNTSC988uv0nuS9Th3TSGI/kGQYg7Ng5A8MnL1
 iztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683717384; x=1686309384;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pBsIndB/0JBmV2qr33mCTEeeS4Iy2jxh4GLVwKZXMKo=;
 b=O3nw/SXH4BPoUKaHakPMDr5XqKRRE3IWqzDeAUyZchLYiHwAHitOno+toVSyYskA7M
 tFV7r+LpgI0xSppCo4asDpzMPGptGxuM+QiKJJdQ/UEMCkvqBTQdHI/u5pKC4Y8OTz2r
 oS4BgVOQoyOMl61t1VgYtrXb3m3SQtFh+/9GW6rrzGSevNC5ryKj0EYwt1wKFSzND1QS
 r9vRPDuaf7uNvVi1N/b5G/QgjBZYyPmxl5JmXY7oha56bL6SaCBuWcUwhQ8YjSCMn2TY
 uaxFuSz9nE10QFN61+j4tK9KvJWYlk1QAovUip/Cw4WsCvglOlmIuKGTMRzofh58Fody
 fXrA==
X-Gm-Message-State: AC+VfDymUDqfJsBAuw9q1DTJO10yxNiuRz8LdWpYV6zWaDw3DJP1nTiS
 fSUSWhKWygCgySJT9uxPRvE=
X-Google-Smtp-Source: ACHHUZ6CkBmwDOlHCbYrI/mphVqzmMF7zFthMe87Sh8XjvMWEmrUJjFgtJQjuQrwXn/I0+sYY1bmIg==
X-Received: by 2002:a05:600c:28f:b0:3f1:8430:523 with SMTP id
 15-20020a05600c028f00b003f184300523mr12094415wmk.14.1683717384131; 
 Wed, 10 May 2023 04:16:24 -0700 (PDT)
Received: from localhost ([146.70.133.78]) by smtp.gmail.com with ESMTPSA id
 f4-20020adffcc4000000b003063d83a168sm16937426wrs.26.2023.05.10.04.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 04:16:23 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 10 May 2023 13:16:21 +0200
Message-Id: <CSIJZYWBC38N.2M99O6W1PLR4B@vincent-arch>
Subject: Re: [PATCH v1] drivers: pci: introduce configurable delay for
 Rockchip PCIe bus scan
From: "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To: "Peter Geis" <pgwipeout@gmail.com>, "Bjorn Helgaas" <helgaas@kernel.org>
X-Mailer: aerc 0.15.1
References: <20230509153912.515218-1-vincenzopalazzodev@gmail.com>
 <20230509211902.GA1270901@bhelgaas>
 <CAMdYzYp6=mYSoUHN3TEXVSMbRt1HpRm0X_4RMez09V0XzQewaw@mail.gmail.com>
In-Reply-To: <CAMdYzYp6=mYSoUHN3TEXVSMbRt1HpRm0X_4RMez09V0XzQewaw@mail.gmail.com>
Cc: kw@linux.com, heiko@sntech.de, robh@kernel.org, linux-pci@vger.kernel.org,
 shawn.lin@rock-chips.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 linux-rockchip@lists.infradead.org, broonie@kernel.org, bhelgaas@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org, lpieralisi@kernel.org,
 linux-arm-kernel@lists.infradead.org, Dan Johansen <strit@manjaro.org>
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

PiBPbiBUdWUsIE1heSA5LCAyMDIzIGF0IDU6MTnigK9QTSBCam9ybiBIZWxnYWFzIDxoZWxnYWFz
QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEhpIFZpbmNlbnpvLAo+ID4KPiA+IFRoYW5rcyBm
b3IgcmFpc2luZyB0aGlzIGlzc3VlLiAgTGV0J3Mgc2VlIHdoYXQgd2UgY2FuIGRvIHRvIGFkZHJl
c3MKPiA+IGl0Lgo+ID4KPiA+IE9uIFR1ZSwgTWF5IDA5LCAyMDIzIGF0IDA1OjM5OjEyUE0gKzAy
MDAsIFZpbmNlbnpvIFBhbGF6em8gd3JvdGU6Cj4gPiA+IEFkZCBhIGNvbmZpZ3VyYWJsZSBkZWxh
eSB0byB0aGUgUm9ja2NoaXAgUENJZSBkcml2ZXIgdG8gYWRkcmVzcwo+ID4gPiBjcmFzaGVzIHRo
YXQgb2NjdXIgb24gc29tZSBvbGQgZGV2aWNlcywgc3VjaCBhcyB0aGUgUGluZTY0IFJvY2tQcm82
NC4KPiA+ID4KPiA+ID4gVGhpcyBpc3N1ZSBpcyBhZmZlY3RpbmcgdGhlIEFSTSBjb21tdW5pdHks
IGJ1dCB0aGVyZSBpcyBubwo+ID4gPiB1cHN0cmVhbSBzb2x1dGlvbiBmb3IgaXQgeWV0Lgo+ID4K
PiA+IEl0IHNvdW5kcyBsaWtlIHRoaXMgaGFwcGVucyB3aXRoIHNldmVyYWwgZW5kcG9pbnRzLCBy
aWdodD8gIEFuZCBJCj4gPiBhc3N1bWUgdGhlIGVuZHBvaW50cyB3b3JrIGZpbmUgaW4gb3RoZXIg
bm9uLVJvY2tjaGlwIHN5c3RlbXM/ICBJZgo+ID4gdGhhdCdzIHRoZSBjYXNlLCBteSBndWVzcyBp
cyB0aGUgcHJvYmxlbSBpcyB3aXRoIHRoZSBSb2NrY2hpcCBob3N0Cj4gPiBjb250cm9sbGVyIGFu
ZCBob3cgaXQncyBpbml0aWFsaXplZCwgbm90IHdpdGggdGhlIGVuZHBvaW50cy4KPiA+Cj4gPiBU
aGUgb25seSBkZWxheXMgYW5kIHRpbWVvdXRzIEkgc2VlIGluIHRoZSBkcml2ZXIgbm93IGFyZSBp
bgo+ID4gcm9ja2NoaXBfcGNpZV9ob3N0X2luaXRfcG9ydCgpLCB3aGVyZSBpdCB3YWl0cyBmb3Ig
bGluayB0cmFpbmluZyB0bwo+ID4gY29tcGxldGUuICBJIGFzc3VtZSB0aGUgbGluayB0cmFpbmlu
ZyBkaWQgY29tcGxldGVseSBzdWNjZXNzZnVsbHkKPiA+IHNpbmNlIHlvdSBkb24ndCBtZW50aW9u
IGVpdGhlciBhIGdlbjEgb3IgZ2VuMiB0aW1lb3V0IChhbHRob3VnaCB0aGUKPiA+IGdlbjIgbWVz
c2FnZSBpcyBhIGRldl9kYmcoKSB0aGF0IG5vcm1hbGx5IHdvdWxkbid0IGdvIHRvIHRoZSBjb25z
b2xlKS4KPiA+Cj4gPiBJIGRvbid0IGtub3cgdGhhdCB0aGUgc3BlYyBjb250YWlucyBhIHJldHJh
aW4gdGltZW91dCB2YWx1ZS4gIFNldmVyYWwKPiA+IG90aGVyIGRyaXZlcnMgdXNlIDEgc2Vjb25k
LCB3aGlsZSByb2NrY2hpcCB1c2VzIDUwMG1zIChmb3IgZXhhbXBsZSwKPiA+IHNlZSBMSU5LX1JF
VFJBSU5fVElNRU9VVCBhbmQgTElOS19VUF9USU1FT1VUKS4KPiA+Cj4gPiBJIHRoaW5rIHdlIG5l
ZWQgdG8gdW5kZXJzdGFuZCB0aGUgaXNzdWUgYmV0dGVyIGJlZm9yZSBhZGRpbmcgYSBEVAo+ID4g
cHJvcGVydHkgYW5kIGEgbW9kdWxlIHBhcmFtZXRlci4gIFRob3NlIGFyZSBoYXJkIGZvciB1c2Vy
cyB0byBkZWFsCj4gPiB3aXRoLiAgSWYgd2UgY2FuIGZpZ3VyZSBvdXQgYSB2YWx1ZSB0aGF0IHdv
cmtzIGZvciBldmVyeWJvZHksIGl0IHdvdWxkCj4gPiBiZSBiZXR0ZXIgdG8ganVzdCBoYXJkLWNv
ZGUgaXQgaW4gdGhlIGRyaXZlciBhbmQgdXNlIHRoYXQgYWxsIHRoZQo+ID4gdGltZS4KPgo+IEdv
b2QgRXZlbmluZywKPgo+IFRoZSBtYWluIGlzc3VlIHdpdGggdGhlIHJrMzM5OSBpcyB0aGUgUENJ
ZSBjb250cm9sbGVyIGlzIGJ1Z2d5IGFuZAo+IHRyaWdnZXJzIGEgU29DIHBhbmljIHdoZW4gY2Vy
dGFpbiBlcnJvciBjb25kaXRpb25zIG9jY3VyIHRoYXQgc2hvdWxkCj4gYmUgaGFuZGxlZCBncmFj
ZWZ1bGx5LiBPbmUgb2YgdGhvc2UgY29uZGl0aW9ucyBpcyB3aGVuIGFuIGVuZHBvaW50Cj4gcmVx
dWVzdHMgYW4gYWNjZXNzIHRvIHdhaXQgYW5kIHJldHJ5IGxhdGVyLiBNYW55IHllYXJzIGFnbyB3
ZSByYW4gdGhhdAo+IGlzc3VlIHRvIGdyb3VuZCBhbmQgd2l0aCBSb2JpbiBNdXJwaHkncyBoZWxw
IHdlIGZvdW5kIHRoYXQgd2hpbGUgaXQncwo+IHBvc3NpYmxlIHRvIGdyYWNlZnVsbHkgaGFuZGxl
IHRoYXQgY29uZGl0aW9uIGl0IHJlcXVpcmVkIGhpamFja2luZyB0aGUKPiBlbnRpcmUgYXJtNjQg
ZXJyb3IgaGFuZGxpbmcgcm91dGluZS4gTm90IGV4YWN0bHkgc2NhbGFibGUgZm9yIGp1c3Qgb25l
Cj4gU29DLiBUaGUgY29uZmlndXJhYmxlIHdhaXRzIGFsbG93IHVzIHRvIHByb2dyYW0gcmVhc29u
YWJsZSB0aW1lcyBmb3IKPiA5MCUgb2YgdGhlIGVuZHBvaW50cyB0aGF0IGNvbWUgdXAgaW4gdGhl
IG5vcm1hbCBhbW91bnQgb2YgdGltZSwgd2hpbGUKPiBiZWluZyBhYmxlIHRvIGFkanVzdCBpdCBm
b3IgdGhlIG90aGVyIDEwJSB0aGF0IGRvIG5vdC4gU29tZSByZXF1aXJlCj4gbXVsdGlwbGUgc2Vj
b25kcyBiZWZvcmUgdGhleSByZXR1cm4gd2l0aG91dCBlcnJvci4gUGFydCBvZiB0aGUgcmVhc29u
Cj4gd2UgZG9uJ3Qgd2FudCB0byBoYXJkY29kZSB0aGUgd2FpdCB0aW1lIGlzIGJlY2F1c2UgdGhl
IHByb2JlIGlzbid0Cj4gaGFuZGxlZCBhc3luY2hyb25vdXNseSwgc28gdGhlIGtlcm5lbCBhcHBl
YXJzIHRvIGhhbmcgd2hpbGUgd2FpdGluZwo+IGZvciB0aGUgdGltZW91dC4KClllYWgsIEkgc21l
bGwgYSBoYXJkd2FyZSBidWcgaW4gbXkgY29kZS4gSSBoYXRlIHdhaXRpbmcgaW4gdGhpcyB3YXkg
aW5zaWRlIAp0aGUgY29kZSwgc28gaXQncyB1c3VhbGx5IHdyb25nIHdoZW4geW91IG5lZWQgdG8g
ZG8gc29tZXRoaW5nIGxpa2UgdGhhdC4KCkR1cmluZyBteSByZXNlYXJjaCwgSSBhbHNvIGZvdW5k
IHRoaXMgcGF0Y2ggKGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9
MjEzNDE3NykgCnRoYXQgcHJvdmlkZXMgYSBmaXggaW4gYW5vdGhlciBwb3NzaWJseSBjbGVhbmVy
IHdheS4KCkJ1dCBJIGRvbid0IHVuZGVyc3RhbmQgdGhlIHJlYXNvbmluZyBiZWhpbmQgaXQsIHNv
IG1heWJlIEkgCmhhdmVuJ3Qgc3BlbnQgZW5vdWdoIHRpbWUgdGhpbmtpbmcgYWJvdXQgaXQuCgo+
IEknbSBjdXJpb3VzIGlmIGl0J3MgYmVlbiB0ZXN0ZWQgd2l0aCB0aGlzIHNlcmllcyBvbiB0b3A6
Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8yMDIzMDQxODA3NDcw
MC4xMDgzNTA1LTgtcmljay53ZXJ0ZW5icm9la0BnbWFpbC5jb20vVC8KPiBJJ20gcGFydGljdWxh
cmx5IGN1cmlvdXMgaWYKPiBbdjUsMDQvMTFdIFBDSTogcm9ja2NoaXA6IEFkZCBwb2xsIGFuZCB0
aW1lb3V0IHRvIHdhaXQgZm9yIFBIWSBQTExzIHRvIGJlIGxvY2tlZAo+IG1ha2VzIGEgZGlmZmVy
ZW5jZSBpbiB0aGUgYmVoYXZpb3IuIFBsZWFzZSB0ZXN0IHRoaXMgYW5kIHNlZSBpZiBpdAo+IGlt
cHJvdmVzIHRoZSB0aW1lb3V0cyB5b3UgbmVlZCBmb3IgdGhlIGVuZHBvaW50cyB5b3UncmUgdGVz
dGluZwo+IGFnYWluc3QuCgpNaCwgSSBjYW4gdHJ5IHRvIGNoZXJyeS1waWNrIHRoZSBjb21taXQg
YW5kIHRlc3QgaXQgaW4gbXkgb3duIHRlc3QgZW52aXJvbm1lbnQuIEN1cnJlbnRseSwgSSBoYXZl
bid0IGJlZW4gCmFibGUgdG8gdGVzdCBpdCBkdWUgdG8gYSBsYWNrIG9mIGhhcmR3YXJlLCBidXQg
SSdtIHNlZWtpbmcgYSB3YXkgdG8gb2J0YWluIG9uZS4gCkx1Y2tpbHksIEkgaGF2ZSBzb21lb25l
IG9uIHRoZSBNYW5qYXJvIGFybSB0ZWFtIHdobyBjYW4gaGVscCBtZSB0ZXN0IGl0LCAKc28gSSds
bCB0cnkgdG8gZG8gdGhhdC4KCkNoZWVycyEKClZpbmNlbnQuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcg
bGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5l
bC1tZW50ZWVzCg==
