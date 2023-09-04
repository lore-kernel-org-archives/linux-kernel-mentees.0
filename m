Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503DFC83F2C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Sep 2023 07:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA96060FA0;
	Mon,  4 Sep 2023 07:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA96060FA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l0DTwEJfLwKY; Mon,  4 Sep 2023 07:23:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CA70860F7D;
	Mon,  4 Sep 2023 07:23:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA70860F7D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7918C0071;
	Mon,  4 Sep 2023 07:23:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83C14C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Sep 2023 07:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EF2540382
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Sep 2023 07:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EF2540382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qwHrxcDKlyRh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Sep 2023 07:23:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45E90400B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Sep 2023 07:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45E90400B9
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2C2A660C03;
 Mon,  4 Sep 2023 07:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504BBC433C8;
 Mon,  4 Sep 2023 07:23:06 +0000 (UTC)
Message-ID: <ff0475f0-b48e-ad5d-ae66-54308bf98464@xs4all.nl>
Date: Mon, 4 Sep 2023 09:23:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5] media: gspca: cpia1: shift-out-of-bounds in set_flicker
To: Rajeshwar Shinde <coolrrsh@gmail.com>, mchehab@kernel.org,
 slark_xiao@163.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230830074401.7696-1-coolrrsh@gmail.com>
 <CA+VNjV0pkR7w5Z_z8wS8WxckfSJ43sN8rGkWO6nxzYNHL4U46Q@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <CA+VNjV0pkR7w5Z_z8wS8WxckfSJ43sN8rGkWO6nxzYNHL4U46Q@mail.gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+e27f3dbdab04e43b9f73@syzkaller.appspotmail.com
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

UmVsYXggOi0pIEknbGwgcGljayBpdCB1cCB0aGUgbmV4dCB0aW1lIEkgZ28gdGhyb3VnaCBzaW1w
bGUgYnVnIGZpeCBwYXRjaGVzCmxpa2UgdGhpcyBvbmUsIHByb2JhYmx5IGluIDItMyB3ZWVrcyBv
ciBzby4KClJlZ2FyZHMsCgoJSGFucwoKT24gMDIvMDkvMjAyMyAxOTo1NiwgUmFqZXNod2FyIFNo
aW5kZSB3cm90ZToKPiBSZW1haW5kZXLCoAo+IAo+IE9uIFdlZCwgMzAgQXVnLCAyMDIzLCAxOjE0
IHBtICwgPGNvb2xycnNoQGdtYWlsLmNvbSA8bWFpbHRvOmNvb2xycnNoQGdtYWlsLmNvbT4+IHdy
b3RlOgo+IAo+ICAgICBGcm9tOiBSYWplc2h3YXIgUiBTaGluZGUgPGNvb2xycnNoQGdtYWlsLmNv
bSA8bWFpbHRvOmNvb2xycnNoQGdtYWlsLmNvbT4+Cj4gCj4gICAgIFN5emthbGxlciByZXBvcnRl
ZCB0aGUgZm9sbG93aW5nIGlzc3VlOgo+ICAgICBVQlNBTjogc2hpZnQtb3V0LW9mLWJvdW5kcyBp
biBkcml2ZXJzL21lZGlhL3VzYi9nc3BjYS9jcGlhMS5jOjEwMzE6MjcKPiAgICAgc2hpZnQgZXhw
b25lbnQgMjQ1IGlzIHRvbyBsYXJnZSBmb3IgMzItYml0IHR5cGUgJ2ludCcKPiAKPiAgICAgV2hl
biB0aGUgdmFsdWUgb2YgdGhlIHZhcmlhYmxlICJzZC0+cGFyYW1zLmV4cG9zdXJlLmdhaW4iIGV4
Y2VlZHMgdGhlCj4gICAgIG51bWJlciBvZiBiaXRzIGluIGFuIGludGVnZXIsIGEgc2hpZnQtb3V0
LW9mLWJvdW5kcyBlcnJvciBpcyByZXBvcnRlZC4gSXQKPiAgICAgaXMgdHJpZ2dlcmVkIGJlY2F1
c2UgdGhlIHZhcmlhYmxlICJjdXJyZW50ZXhwIiBjYW5ub3QgYmUgbGVmdC1zaGlmdGVkIGJ5Cj4g
ICAgIG1vcmUgdGhhbiB0aGUgbnVtYmVyIG9mIGJpdHMgaW4gYW4gaW50ZWdlci4gSW4gb3JkZXIg
dG8gYXZvaWQgaW52YWxpZAo+ICAgICByYW5nZSBkdXJpbmcgbGVmdC1zaGlmdCwgdGhlIGNvbmRp
dGlvbmFsIGV4cHJlc3Npb24gaXMgYWRkZWQuCj4gCj4gCj4gICAgIFJlcG9ydGVkLWJ5OiBzeXpi
b3QrZTI3ZjNkYmRhYjA0ZTQzYjlmNzNAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbSA8bWFpbHRv
OnN5emJvdCUyQmUyN2YzZGJkYWIwNGU0M2I5ZjczQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20+
Cj4gICAgIENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwODE4MTY0NTIy
LjEyODA2LTEtY29vbHJyc2hAZ21haWwuY29tIDxodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyMzA4MTgxNjQ1MjIuMTI4MDYtMS1jb29scnJzaEBnbWFpbC5jb20+Cj4gICAgIExpbms6IGh0
dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD1lMjdmM2RiZGFiMDRlNDNiOWY3
Mwo+ICAgICBTaWduZWQtb2ZmLWJ5IDxodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/
ZXh0aWQ9ZTI3ZjNkYmRhYjA0ZTQzYjlmNzNTaWduZWQtb2ZmLWJ5PjogUmFqZXNod2FyIFIgU2hp
bmRlIDxjb29scnJzaEBnbWFpbC5jb20gPG1haWx0bzpjb29scnJzaEBnbWFpbC5jb20+Pgo+ICAg
ICAtLS0KPiAgICAgdjEtPnYyCj4gICAgIENoYW5nZWQgdGhlIHBhdGNoLiBJbnN0ZWFkIG9mIGF2
b2lkaW5nIHNoaWZ0IG9wZXJhdGlvbiBmb3IgaW52YWxpZAo+ICAgICBpbnB1dCBvZiAnZXhwb3N1
cmUuZ2FpbicsIHRocm93IGFuIGVycm9yIGZvciBpbnZhbGlkIHJhbmdlLgo+ICAgICB2Mi0+djMK
PiAgICAgQ2hhbmdlZCB0aGUgY29tbWl0IG1lc3NhZ2UgZGV0YWlscwo+ICAgICB2My0+djQKPiAg
ICAgUmVtb3ZlZCB0aGUgdHJhaWxpbmcgc3BhY2VzIGluIGNvbW1pdCBtZXNzYWdlCj4gICAgIHY0
LT52NQo+ICAgICBSZXBsYWNlZCB0aGUgaGFyZGNvZGVkIHZhbHVlIHdpdGggaW5idWlsdCBtYWNy
bwo+ICAgICAtLS0KPiAgICAgwqBkcml2ZXJzL21lZGlhL3VzYi9nc3BjYS9jcGlhMS5jIHwgMyAr
KysKPiAgICAgwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gICAgIGRpZmYg
LS1naXQgYS9kcml2ZXJzL21lZGlhL3VzYi9nc3BjYS9jcGlhMS5jIGIvZHJpdmVycy9tZWRpYS91
c2IvZ3NwY2EvY3BpYTEuYwo+ICAgICBpbmRleCA0NmVkOTU0ODNlMjIuLjVmNWZhODUxY2E2NCAx
MDA2NDQKPiAgICAgLS0tIGEvZHJpdmVycy9tZWRpYS91c2IvZ3NwY2EvY3BpYTEuYwo+ICAgICAr
KysgYi9kcml2ZXJzL21lZGlhL3VzYi9nc3BjYS9jcGlhMS5jCj4gICAgIEBAIC0xOCw2ICsxOCw3
IEBACj4gCj4gICAgIMKgI2luY2x1ZGUgPGxpbnV4L2lucHV0Lmg+Cj4gICAgIMKgI2luY2x1ZGUg
PGxpbnV4L3NjaGVkL3NpZ25hbC5oPgo+ICAgICArI2luY2x1ZGUgPGxpbnV4L2JpdG9wcy5oPgo+
IAo+ICAgICDCoCNpbmNsdWRlICJnc3BjYS5oIgo+IAo+ICAgICBAQCAtMTAyOCw2ICsxMDI5LDgg
QEAgc3RhdGljIGludCBzZXRfZmxpY2tlcihzdHJ1Y3QgZ3NwY2FfZGV2ICpnc3BjYV9kZXYsIGlu
dCBvbiwgaW50IGFwcGx5KQo+ICAgICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBzZC0+cGFyYW1zLmV4cG9zdXJlLmV4cE1vZGUgPSAyOwo+ICAgICDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBzZC0+ZXhwb3N1cmVfc3RhdHVzID0gRVhQT1NVUkVfTk9STUFM
Owo+ICAgICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGlmIChzZC0+cGFyYW1zLmV4cG9zdXJlLmdhaW4gPj0gQklUU19QRVJfVFlQRShjdXJy
ZW50ZXhwKSkKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJu
IC1FSU5WQUw7Cj4gICAgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGN1cnJlbnRleHAgPSBjdXJy
ZW50ZXhwIDw8IHNkLT5wYXJhbXMuZXhwb3N1cmUuZ2FpbjsKPiAgICAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgc2QtPnBhcmFtcy5leHBvc3VyZS5nYWluID0gMDsKPiAgICAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgLyogcm91bmQgZG93biBjdXJyZW50IGV4cG9zdXJlIHRvIG5lYXJlc3QgdmFs
dWUgKi8KPiAgICAgLS0gCj4gICAgIDIuMjUuMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0
CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1l
bnRlZXMK
