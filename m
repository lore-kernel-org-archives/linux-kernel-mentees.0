Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED67EB64DA
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Jul 2023 17:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAD2881F4D;
	Mon, 10 Jul 2023 17:21:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAD2881F4D
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=XjWiHEqf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aMCNcdJADmP1; Mon, 10 Jul 2023 17:21:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7562681F7C;
	Mon, 10 Jul 2023 17:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7562681F7C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 592C6C0071;
	Mon, 10 Jul 2023 17:21:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01A0EC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 17:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D057D60F82
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 17:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D057D60F82
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20221208 header.b=XjWiHEqf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VQ6SD8hBjNTa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 17:21:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC7DC60F23
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC7DC60F23
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 17:21:04 +0000 (UTC)
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-53425d37fefso5500669a12.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 10:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1689009664; x=1691601664;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=DmU2+5hRWoL+pZqKJ05G+ZLf8jgBoRxUhLoRim7iXdw=;
 b=XjWiHEqfCseEhn60v58akWR+Kii8fw3IX+mzVKNFqTiWNWIYad5u2m6pGwvg9spU3G
 cjRxM+zHzYzkwHW6TpyOlXuRwaOk/G8QzYvIvPx8P6xPkDp454Gk72qwGmtGXL/VaWla
 Q0gLvoCdBGoqyNi4IBJCa/vixwkY7XJWvnXyNj4MvxwHYPJGQ4kWkLckRsYYamjy02Ow
 yOEnUknN0Hk4kVl7+lAFs/YFZ6jMp9BoTee0ZGO3QxxmYJiE1s6yFeqZEjXbHjHISBCN
 lbkYMXuEG4lqiGLjoeTYwOe0+JmCkQ9CreA9CafCg0a7w/FdLusJTGW2rXro0A73QqTB
 QKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689009664; x=1691601664;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=DmU2+5hRWoL+pZqKJ05G+ZLf8jgBoRxUhLoRim7iXdw=;
 b=V3yIUmqkCFBJF3DX4fAWW+VLLcT9XVEkh3o+lXzoXwPp1J1QcS4EObrGjXvjwglcvR
 nCmuWsjDLxt9XH1ZT6HICrqM8bxcbOiDjMUkjja2jsX+OaBhNR/N8RtlWDLnBqKWN4kz
 uNuORzRbPQRuy9UuyT+xsuIrF1y1xmqp+IKGhQKYbXCS2MX52j1UaEPm2a5+kyGLgDO8
 hBD8T7GqzLk6vccWz2Ik8u1t8NkcNFhXhnd0xXqxYRpof23zNAOvPGgLbTxpm2mX8Rwn
 oTesOZKxjuNCLmyTaDQQBgrSz41WtnSGeNo1kFm0BbbOqjeWCto2SiNFpNZSVpXTknag
 O1Iw==
X-Gm-Message-State: ABy/qLaxFAEv4PrtLCOjq8dBOkLi/W97ibFG9cLMTtCQ5hrPwun2H2An
 0Fv8s812K/i0H8CJOf6TXtGHXyQ=
X-Google-Smtp-Source: APBJJlESkUSQK49CxEg85CDws6p3+OE/VlXKu5fJXfbxk71EWAjEUZqTOiuIpSgS9EKNVNwvsGND5XQ=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a63:9316:0:b0:55a:e71b:45b9 with SMTP id
 b22-20020a639316000000b0055ae71b45b9mr8945120pge.2.1689009664229; Mon, 10 Jul
 2023 10:21:04 -0700 (PDT)
Date: Mon, 10 Jul 2023 10:21:02 -0700
In-Reply-To: <CAABMjtHc4Vu=_L4rOhy1a-m0nQ-ptHe68qXJd__mSQAgO+t_iw@mail.gmail.com>
Mime-Version: 1.0
References: <bd1477f2-a51e-a795-4f25-a32d6ab46530@gmail.com>
 <ZKcE+wMWGdVFSBX2@google.com> <32d67707-b831-9a98-4cb9-fcb27c8806ef@gmail.com>
 <ZKhEEJfzCyYI7BfH@google.com> <5d336a9a-8ae5-2b1f-7af3-a94818867b40@gmail.com>
 <CAABMjtHc4Vu=_L4rOhy1a-m0nQ-ptHe68qXJd__mSQAgO+t_iw@mail.gmail.com>
Message-ID: <ZKw9/jIZs73jT190@google.com>
Subject: Re: [PATCH v2] samples/bpf: Add more instructions to build
 dependencies and, configuration in README.rst
To: Khalid Masum <khalid.masum.92@gmail.com>
Cc: daniel@iogearbox.net, linux-kernel-mentees@lists.linuxfoundation.org,
 andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org,
 Anh Tuan Phan <tuananhlfc@gmail.com>, martin.lau@linux.dev
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

T24gMDcvMDksIEtoYWxpZCBNYXN1bSB3cm90ZToKPiBIaSwKPiAKPiBPbiBTdW4sIEp1bCA5LCAy
MDIzIGF0IDg6MzjigK9QTSBBbmggVHVhbiBQaGFuIDx0dWFuYW5obGZjQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gPgo+ID4gSGkgU3RhbmlzbGF2LAo+ID4KPiA+IEkgaGF2ZSB1cGRhdGVkIHRoZSBEb2N1
bWVudGF0aW9uIGFjY29yZGluZyB0byB5b3VyIHN1Z2dlc3Rpb24uIFBsZWFzZQo+ID4gc2VlIGl0
IGluIHRoZSBiZWxvdyBwYXRjaC4gVGhhbmtzIQo+ID4KPiA+IE9uIDcvNy8yMyAyMzo1NywgU3Rh
bmlzbGF2IEZvbWljaGV2IHdyb3RlOgo+ID4gPiBPbiAwNy8wNywgQW5oIFR1YW4gUGhhbiB3cm90
ZToKPiA+ID4+Cj4gPiA+Pgo+ID4gPj4gT24gNy83LzIzIDAxOjE2LCBTdGFuaXNsYXYgRm9taWNo
ZXYgd3JvdGU6Cj4gPiA+Pj4gT24gMDcvMDYsIEFuaCBUdWFuIFBoYW4gd3JvdGU6Cj4gPiA+Pj4+
IFVwZGF0ZSB0aGUgRG9jdW1lbnRhdGlvbiB0byBtZW50aW9uIHRoYXQgc29tZSBzYW1wbGVzIHJl
cXVpcmUgcGFob2xlCj4gPiA+Pj4+IHYxLjE2IGFuZCBrZXJuZWwgYnVpbHQgd2l0aCBDT05GSUdf
REVCVUdfSU5GT19CVEY9eQo+ID4gPj4+Pgo+ID4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmggVHVh
biBQaGFuIDx0dWFuYW5obGZjQGdtYWlsLmNvbT4KPiA+ID4+Pj4gLS0tCj4gPiA+Pj4+ICBzYW1w
bGVzL2JwZi9SRUFETUUucnN0IHwgNyArKysrKysrCj4gPiA+Pj4+ICAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspCj4gPiA+Pj4+Cj4gPiA+Pj4+IGRpZmYgLS1naXQgYS9zYW1wbGVzL2Jw
Zi9SRUFETUUucnN0IGIvc2FtcGxlcy9icGYvUkVBRE1FLnJzdAo+ID4gPj4+PiBpbmRleCA1N2Y5
M2VkZDE5NTcuLjYzMTU5MmI4M2Q2MCAxMDA2NDQKPiA+ID4+Pj4gLS0tIGEvc2FtcGxlcy9icGYv
UkVBRE1FLnJzdAo+ID4gPj4+PiArKysgYi9zYW1wbGVzL2JwZi9SRUFETUUucnN0Cj4gPiA+Pj4+
IEBAIC0xNCw2ICsxNCw5IEBAIENvbXBpbGluZyByZXF1aXJlcyBoYXZpbmcgaW5zdGFsbGVkOgo+
ID4gPj4+PiAgTm90ZSB0aGF0IExMVk0ncyB0b29sICdsbGMnIG11c3Qgc3VwcG9ydCB0YXJnZXQg
J2JwZicsIGxpc3QgdmVyc2lvbgo+ID4gPj4+PiAgYW5kIHN1cHBvcnRlZCB0YXJnZXRzIHdpdGgg
Y29tbWFuZDogYGBsbGMgLS12ZXJzaW9uYGAKPiA+ID4+Pj4KPiA+ID4+Pj4gK1NvbWUgc2FtcGxl
cyByZXF1aXJlIHBhaG9sZSB2ZXJzaW9uIDEuMTYgYXMgYSBkZXBlbmRlbmN5LiBTZWUKPiA+ID4+
Pj4gK2h0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2JwZi9icGZfZGV2ZWxfUUEuaHRtbCBmb3IgcmVm
ZXJlbmNlLgo+ID4gPj4+PiArCj4gPiA+Pj4KPiA+ID4+PiBBbnkgcmVhc29uIG5vIHRvIGFkZCBw
YWhvbGUgMS4xNiB0byB0aGlzIHNlY3Rpb24gYWJvdmU/Cj4gPiA+Pj4+IENvbXBpbGluZyByZXF1
aXJlcyBoYXZpbmcgaW5zdGFsbGVkOgo+ID4gPj4+ICAqIGNsYW5nID49IHZlcnNpb24gMy40LjAK
PiA+ID4+PiAgKiBsbHZtID49IHZlcnNpb24gMy43LjEKPiA+ID4+PiAgKiBwYWhvbGUgPj0gdmVy
c2lvbiAxLjE2Cj4gPiA+Pj4KPiA+ID4+PiBBbHRob3VnaCBjbGFuZyAzLjQgcHJvYmFibHkgd29u
J3QgZ2V0IHlvdSBhbnl3aGVyZSB0aGVzZSBkYXlzLiBUaGUKPiA+ID4+PiB3aG9sZSBSRUFETUUg
c2VlbXMgYSBiaXQgb3V0ZGF0ZWQgOi0pCj4gPiA+Pj4KPiA+ID4+Cj4gPiA+PiBQdXQgcGFob2xl
IHJlcXVpcmVtZW50IGFzIHlvdXIgaWRlYSBpcyBiZXR0ZXIsIHRoYW5rcyBmb3Igc3VnZ2VzdGlv
bi4KPiA+ID4+IFdpbGwgdXBkYXRlIGl0IGFuZCBjbGFuZyB2ZXJzaW9uIGFzIHdlbGwuIEZvciBj
bGFuZyB2ZXJzaW9uLCBJIHRoaW5rIEkKPiA+ID4+IGNhbiB1cGRhdGUgbWluIHZlcnNpb24gYXMg
MTEuMC4wIChyZWZlcmVuY2UgZnJvbQo+ID4gPj4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2Mv
aHRtbC9uZXh0L3Byb2Nlc3MvY2hhbmdlcy5odG1sKS4gRG8geW91IHNlZQo+ID4gPj4gYW55IG90
aGVyIHBvdGVudGlhbCBvdXRkYXRlZCB0aGluZ3MgaW4gdGhpcyBkb2N1bWVudD8gSSBmb2xsb3cg
dGhlIGFib3ZlCj4gPiA+PiBzdGVwcyBhbmQgaXQgaGVscCBtZSBjb21waWxlIHRoZSBzYW1wbGUg
Y29kZSBzdWNjZXNzZnVsbHkuCj4gPiA+Cj4gPiA+IE1heWJlIHdlIGNhbiByZWZlcmVuY2UgdGhh
dCBkb2MgaW5zdGVhZCBoZXJlPyBPdGhlcndpc2UgdGhhdCBjb3B5LXBhc3RlZAo+ID4gPiAxMS4w
LjAgd2lsbCBhbHNvIGdldCBvbGQuIEp1c3QgbWVudGlvbiBoZXJlIHRoYXQgd2UgbmVlZAo+ID4g
PiBjbGFuZy9sbHZtL3BhaG9sZSB0byBjb21waWxlIHRoZSBzYW1wbGVzIGFuZCBmb3Igc3BlY2lm
aWMgdmVyc2lvbnMKPiA+ID4gcHV0IGEgbGluayB0byBwcm9jZXNzL2NoYW5nZXMucnN0Cj4gPiA+
Cj4gPiA+Pj4+ICBDbGVhbiBhbmQgY29uZmlndXJhdGlvbgo+ID4gPj4+PiAgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPiA+ID4+Pj4KPiA+ID4+Pj4gQEAgLTI4LDYgKzMxLDEwIEBAIENvbmZpZ3Vy
ZSBrZXJuZWwsIGRlZmNvbmZpZyBmb3IgaW5zdGFuY2U6Ogo+ID4gPj4+Pgo+ID4gPj4+PiAgIG1h
a2UgZGVmY29uZmlnCj4gPiA+Pj4+Cj4gPiA+Pj4+ICtTb21lIHNhbXBsZXMgcmVxdWlyZSBzdXBw
b3J0IGZvciBCUEYgVHlwZSBGb3JtYXQgKEJURikuIFRvIGVuYWJsZSBpdCwKPiA+ID4+Pj4gb3Bl
biB0aGUKPiA+ID4+Pj4gK2dlbmVyYXRlZCBjb25maWcgZmlsZSwgb3IgdXNlIG1lbnVjb25maWcg
KGJ5ICJtYWtlIG1lbnVjb25maWciKSB0bwo+ID4gPj4+PiBlbmFibGUgdGhlCj4gPiA+Pj4+ICtm
b2xsb3dpbmcgY29uZmlnczogQ09ORklHX0JQRl9TWVNDQUxMIGFuZCBDT05GSUdfREVCVUdfSU5G
T19CVEYuCj4gPiA+Pj4+ICsKPiA+ID4+Pgo+ID4gPj4+IFRoaXMgaXMgdXN1YWxseSBlbmFibGVk
IGJ5IGRlZmF1bHQsIHNvIHdoeSBzcGVjaWFsIGNhc2UgaXQgaGVyZT8KPiA+ID4+PiBNYXliZSwg
aWYgeW91IHdhbnQgc29tZSBoaW50cyBhYm91dCB0aGUgY29uZmlnLCB3ZSBzaG91bGQgYWRkCj4g
PiA+Pj4gYSByZWZlcmVuY2UgdG8gdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL2NvbmZpZyA/
Cj4gPiA+Pj4KPiA+ID4+Cj4gPiA+PiBUaGUgY29uZmlnIENPTkZJR19ERUJVR19JTkZPX0JURiBp
cyBkaXNhYmxlZCBmb3Igc29tZSBkaXN0cm9zIGF0IGxlYXN0Cj4gPiA+PiBmb3IgbWluZS4gSSBy
YW4gIm1ha2UgZGVmY29uZmlnIiBhbmQgaXQncyBub3QgZW5hYmxlZCBieSBkZWZhdWx0IHNvIEkK
PiA+ID4+IHRoaW5rIGl0IHdvcnRoIHRvIG1lbnRpb24gaXQgaGVyZSB0byBoZWxwIG5vdmljZSBn
ZXQgc3RhcnRlZC4gSSdsbAo+ID4gPj4gdXBkYXRlIGl0IHRvIHJlZmVyZW5jZSB0byB0b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvY29uZmlnIC4KPiA+ID4+Cj4gPiA+Pj4+ICBLZXJuZWwgaGVh
ZGVycwo+ID4gPj4+PiAgLS0tLS0tLS0tLS0tLS0KPiA+ID4+Pj4KPiA+ID4+Pj4gLS0KPiA+ID4+
Pj4gMi4zNC4xCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5oIFR1YW4gUGhhbiA8dHVhbmFuaGxm
Y0BnbWFpbC5jb20+Cj4gPiAtLS0KPiA+Cj4gPiBDaGFuZ2UgZnJvbSB0aGUgb3JpZ2luYWwgcGF0
Y2g6Cj4gPgo+ID4gLSBNb3ZlIHBhaG9sZSB0byB0aGUgbGlzdCBpbnN0YWxsZWQgcmVxdWlyZW1l
bnRzCj4gPiAtIFJlbW92ZSBtaW5pbWFsIHZlcnNpb24gYW5kIGxpbmsgdGhlIHJlbGF0ZWQgZG9j
Cj4gPiAtIEFkZCBhIHJlZmVyZW5jZSBvZiBrZXJuZWwgY29uZmlndXJhdGlvbgo+ID4KPiA+ICBz
YW1wbGVzL2JwZi9SRUFETUUucnN0IHwgMTAgKysrKysrKy0tLQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Nh
bXBsZXMvYnBmL1JFQURNRS5yc3QgYi9zYW1wbGVzL2JwZi9SRUFETUUucnN0Cj4gPiBpbmRleCA1
N2Y5M2VkZDE5NTcuLmUxODUwMDc1M2JhNSAxMDA2NDQKPiA+IC0tLSBhL3NhbXBsZXMvYnBmL1JF
QURNRS5yc3QKPiA+ICsrKyBiL3NhbXBsZXMvYnBmL1JFQURNRS5yc3QKPiA+IEBAIC04LDkgKzgs
MTIgQEAgQnVpbGQgZGVwZW5kZW5jaWVzCj4gPiAgPT09PT09PT09PT09PT09PT09Cj4gPgo+ID4g
IENvbXBpbGluZyByZXF1aXJlcyBoYXZpbmcgaW5zdGFsbGVkOgo+ID4gLSAqIGNsYW5nID49IHZl
cnNpb24gMy40LjAKPiA+IC0gKiBsbHZtID49IHZlcnNpb24gMy43LjEKPiA+ICsgKiBjbGFuZwo+
ID4gKyAqIGxsdm0KPiA+ICsgKiBwYWhvbGUKPiA+Cj4gPiArVGhlIG1pbmltYWwgdmVyc2lvbiBv
ZiB0aGUgYWJvdmUgc29mdHdhcmUgaXMgcmVmZXJlbmNlZCBpbgo+ID4gK2h0dHBzOi8vd3d3Lmtl
cm5lbC5vcmcvZG9jL2h0bWwvbmV4dC9wcm9jZXNzL2NoYW5nZXMuaHRtbC4KPiAKPiBJIHRoaW5r
IGl0IGlzIGJldHRlciB0byBub3QgdXNlIGRvY3MgZnJvbSBsaW51eC1uZXh0IGFzIGl0IGtlZXBz
IGNoYW5naW5nCj4gdG9vIGZyZXF1ZW50bHkuIEhvdyBhYm91dCB1c2luZyB0aGUgbGF0ZXN0IGRv
Y3VtZW50YXRpb24ncyBsaW5rIGluc3RlYWQ/IDopCj4gCj4gaHR0cHM6Ly93d3cua2VybmVsLm9y
Zy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9jaGFuZ2VzLmh0bWwKCisxCgpXZSBzaG91bGQgcHV0
IERvY3VtZW50YXRpb24vcHJvY2Vzcy9jaGFuZ2VzLnJzdCBoZXJlIChvciB3aGF0ZXZlcgp0aGUg
Y29ycmVjdCBwYXRoKS4gVGhlIHRvb2xpbmcgdGhhdCBnZW5lcmF0ZXMgaHRtbCBmcm9tIHJzdCB3
aWxsCnB1dCBhIHByb3BlciBsaW5rLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2Vy
bmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
