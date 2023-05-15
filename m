Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283E7C77B75
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 May 2023 16:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3476418C5;
	Mon, 15 May 2023 16:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3476418C5
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r5lYF9P9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QhXlLRh_DGGx; Mon, 15 May 2023 16:51:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1DEEE418C9;
	Mon, 15 May 2023 16:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DEEE418C9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB1EDC0037;
	Mon, 15 May 2023 16:51:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6BA1C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 May 2023 16:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A798403C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 May 2023 16:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A798403C2
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=r5lYF9P9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HHSMH1EdCrFC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 May 2023 16:51:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F7F540320
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F7F540320
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 May 2023 16:51:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 17EDB6298D;
 Mon, 15 May 2023 16:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490EBC433A1;
 Mon, 15 May 2023 16:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684169504;
 bh=bPE6tiox0+6DYFmbI4QGtsVQa2DaVX/N5GVaQuozKI4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=r5lYF9P9/n/gsCAddF//yyaqmOhUFn8yhkNNIKkC11P6EixEI2iKTyl03mCckUz6f
 jhhxJh/c+fK44jKDuA9ifyIwidPJMmw4TQXNEwN8FC0WBQgEuUPWVbsuzhk8SglgV/
 Sj9y/5rPK+nJz+ucIdXaBQyzO9WqPZal7B6UpO+iCh82qP0DXw9mlRwdqMKOKY4HD/
 B3kh5/ZO+SUUpHz7s+xgMj0ngIwbYOtfh7ZcUefOZvd8IYoJBcWdOrY8gEUZa1qnfc
 yHw+Z8PE4938YrTDfF7gGQp4ZGL/iiH9BlO5SCs1c4/m+01RARk4kxuICrjmFOxPEu
 n479RmOkxMnUw==
Date: Mon, 15 May 2023 11:51:42 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v1] drivers: pci: introduce configurable delay for
 Rockchip PCIe bus scan
Message-ID: <ZGJjHnHNJPqvuqVC@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMdYzYqV72=pQa-U3a2N7MZ2ChBNL74QrxHQLbMZJxiftTK9sA@mail.gmail.com>
Cc: robh@kernel.org, heiko@sntech.de, kw@linux.com, linux-pci@vger.kernel.org,
 shawn.lin@rock-chips.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 linux-rockchip@lists.infradead.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, bhelgaas@google.com,
 Dan Johansen <strit@manjaro.org>, Will Deacon <will@kernel.org>,
 lpieralisi@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Robin Murphy <robin.murphy@arm.com>
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

T24gU2F0LCBNYXkgMTMsIDIwMjMgYXQgMDc6NDA6MTJBTSAtMDQwMCwgUGV0ZXIgR2VpcyB3cm90
ZToKPiBPbiBGcmksIE1heSAxMiwgMjAyMyBhdCA5OjI04oCvUE0gQmpvcm4gSGVsZ2FhcyA8aGVs
Z2Fhc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBbK2NjIEFSTTY0IGZvbGtzLCBpbiBjYXNl
IHlvdSBoYXZlIGFib3J0IGhhbmRsaW5nIHRpcHM7IHRocmVhZCBhdDoKPiA+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAyMzA1MDkxNTM5MTIuNTE1MjE4LTEtdmluY2Vuem9wYWxhenpvZGV2
QGdtYWlsLmNvbV0KPiA+Cj4gPiBQaW5lNjQgUm9ja1BybzY0IHBhbmljcyB3aGlsZSBlbnVtZXJh
dGluZyBzb21lIFBDSWUgZGV2aWNlcy4gIEFkZGluZyBhCj4gPiBkZWxheSBhdm9pZHMgdGhlIHBh
bmljLiAgTXkgdGhlb3J5IGlzIGEgUENJZSBSZXF1ZXN0IFJldHJ5IFN0YXR1cyB0byBhCj4gPiBW
ZW5kb3IgSUQgY29uZmlnIHJlYWQgY2F1c2VzIGFuIGFib3J0IHRoYXQgd2UgZG9uJ3QgaGFuZGxl
Lgo+ID4KPiA+ID4gT24gVHVlLCBNYXkgMDksIDIwMjMgYXQgMDU6Mzk6MTJQTSArMDIwMCwgVmlu
Y2Vuem8gUGFsYXp6byB3cm90ZToKPiA+ID4+IC4uLgo+ID4gPj4gWyAgICAxLjIyOTg1Nl0gU0Vy
cm9yIEludGVycnVwdCBvbiBDUFU0LCBjb2RlIDB4YmYwMDAwMDIgLS0gU0Vycm9yCj4gPiA+PiBb
ICAgIDEuMjI5ODYwXSBDUFU6IDQgUElEOiAxIENvbW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZCA1
LjkuOS0yLjAtTUFOSkFSTy1BUk0KPiA+ID4+ICMxCj4gPiA+PiBbICAgIDEuMjI5ODYyXSBIYXJk
d2FyZSBuYW1lOiBQaW5lNjQgUm9ja1BybzY0IHYyLjEgKERUKQo+ID4gPj4gWyAgICAxLjIyOTg2
NF0gcHN0YXRlOiA2MDAwMDA4NSAoblpDdiBkYUlmIC1QQU4gLVVBTyBCVFlQRT0tLSkKPiA+ID4+
IFsgICAgMS4yMjk4NjZdIHBjIDogcm9ja2NoaXBfcGNpZV9yZF9jb25mKzB4YjQvMHgyNzAKPiA+
ID4+IFsgICAgMS4yMjk4NjhdIGxyIDogcm9ja2NoaXBfcGNpZV9yZF9jb25mKzB4MWI0LzB4Mjcw
Cj4gPiA+PiAuLi4KPiA+ID4+IFsgICAgMS4yMjk5MzldIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5j
aW5nOiBBc3luY2hyb25vdXMgU0Vycm9yIEludGVycnVwdAo+ID4gPj4gLi4uCj4gPiA+PiBbICAg
IDEuMjI5OTU1XSAgbm1pX3BhbmljKzB4OGMvMHg5MAo+ID4gPj4gWyAgICAxLjIyOTk1Nl0gIGFy
bTY0X3NlcnJvcl9wYW5pYysweDc4LzB4ODQKPiA+ID4+IFsgICAgMS4yMjk5NThdICBkb19zZXJy
b3IrMHgxNWMvMHgxNjAKPiA+ID4+IFsgICAgMS4yMjk5NjBdICBlbDFfZXJyb3IrMHg4NC8weDEw
MAo+ID4gPj4gWyAgICAxLjIyOTk2Ml0gIHJvY2tjaGlwX3BjaWVfcmRfY29uZisweGI0LzB4Mjcw
Cj4gPiA+PiBbICAgIDEuMjI5OTY0XSAgcGNpX2J1c19yZWFkX2NvbmZpZ19kd29yZCsweDZjLzB4
ZDAKPiA+ID4+IFsgICAgMS4yMjk5NjZdICBwY2lfYnVzX2dlbmVyaWNfcmVhZF9kZXZfdmVuZG9y
X2lkKzB4MzQvMHgxYjAKPiA+ID4+IFsgICAgMS4yMjk5NjhdICBwY2lfc2Nhbl9zaW5nbGVfZGV2
aWNlKzB4YTQvMHgxNDQKPiA+Cj4gPiBPbiBGcmksIE1heSAxMiwgMjAyMyBhdCAxMjo0NjoyMVBN
ICswMjAwLCBWaW5jZW56byBQYWxhenpvIHdyb3RlOgo+ID4gPiAuLi4gSXMgdGhlcmUgYW55IHdh
eSB0byB0ZWxsIHRoZSBrZXJuZWwgImhleSB3ZSBuZWVkIHNvbWUgbW9yZSB0aW1lCj4gPiA+IGhl
cmUiPwo+ID4KPiA+IFdlIGVudW1lcmF0ZSBQQ0kgZGV2aWNlcyBieSB0cnlpbmcgdG8gcmVhZCB0
aGUgVmVuZG9yIElEIG9mIGV2ZXJ5Cj4gPiBwb3NzaWJsZSBkZXZpY2UgYWRkcmVzcyAoc2VlIHBj
aV9zY2FuX3Nsb3QoKSkuICBPbiBQQ0llLCBpZiBhIGRldmljZQo+ID4gZG9lc24ndCBleGlzdCBh
dCB0aGF0IGFkZHJlc3MsIHRoZSBWZW5kb3IgSUQgY29uZmlnIHJlYWQgd2lsbCBiZQo+ID4gdGVy
bWluYXRlZCB3aXRoIFVuc3VwcG9ydGVkIFJlcXVlc3QgKFVSKSBzdGF0dXMuICBUaGlzIGlzIG5v
cm1hbAo+ID4gYW5kIGhhcHBlbnMgZXZlcnkgdGltZSB3ZSBlbnVtZXJhdGUgZGV2aWNlcy4KPiA+
Cj4gPiBUaGUgY3Jhc2ggZG9lc24ndCBoYXBwZW4gZXZlcnkgdGltZSB3ZSBlbnVtZXJhdGUsIHNv
IEkgZG9uJ3QgdGhpbmsKPiA+IHRoaXMgVVIgaXMgdGhlIHByb2JsZW0uICBBbHNvLCBpZiBpdCAq
d2VyZSogdGhlIHByb2JsZW0sIGFkZGluZyBhCj4gPiBkZWxheSB3b3VsZCBub3QgbWFrZSBhbnkg
ZGlmZmVyZW5jZS4KPiAKPiBJcyB0aGlzIGJlaGF2aW9yIGRpZmZlcmVudCBpZiB0aGVyZSBpcyBh
IHN3aXRjaCBkZXZpY2UgZm9yd2FyZGluZyBvbgo+IHRoZSBVUj8gT24gcmszMzk5IHN3aXRjaGVz
IGFyZSBjb21wbGV0ZWx5IG5vbi1mdW5jdGlvbmFsIGJlY2F1c2Ugb2YKPiB0aGUgcGFuaWMsIHdo
aWNoIGlzIG9ic2VydmVkIGluIHRoZSBvdXRwdXQgb2YgdGhlIGRtZXNnIGluIFsyXSB3aXRoCj4g
dGhlIGhhY2sgcGF0Y2ggZW5hYmxlZC4gQ29uc2lkZXJpbmcgd2hhdCB5b3UganVzdCBkZXNjcmli
ZWQgaXQgbG9va3MKPiBsaWtlIHRoZSBmb3J3YXJkZWQgVVIgZm9yIGVhY2ggbm9uLWV4aXN0ZW50
IGRldmljZSBiZWhpbmQgdGhlIHN3aXRjaAo+IGlzIGNhdXNpbmcgYW4gc2Vycm9yLgoKSSBkb24n
dCBrbm93IGV4YWN0bHkgd2hhdCB0aGUgcGFuaWMgbG9va3MgbGlrZSwgYnV0IEkgd291bGRuJ3Qg
ZXhwZWN0ClVSIGhhbmRsaW5nIHRvIGJlIGRpZmZlcmVudCB3aGVuIHRoZXJlJ3MgYSBzd2l0Y2gu
CgpwY2llLXJvY2tjaGlwLWhvc3QuYyBkb2VzIGhhbmRsZSBkZXZpY2VzIG9uIHRoZSByb290IGJ1
cyAoMDApCmRpZmZlcmVudGx5IHRoYW4gb3RoZXJzIGJlY2F1c2Ugcm9ja2NoaXBfcGNpZV92YWxp
ZF9kZXZpY2UoKSBrbm93cwp0aGF0IGRldmljZSAwMDowMCBpcyB0aGUgb25seSBkZXZpY2Ugb24g
dGhlIHJvb3QgYnVzLiAgVGhhdCBwYXJ0IG1ha2VzCnNlbnNlIGJlY2F1c2UgMDA6MDAgaXMgYnVp
bHQgaW50byB0aGUgU29DLgoKSSdtIGEgbGl0dGxlIHN1c3BpY2lvdXMgb2YgdGhlIGZhY3QgdGhh
dCByb2NrY2hpcF9wY2llX3ZhbGlkX2RldmljZSgpCmFsc28gZW5mb3JjZXMgdGhhdCBidXMgMDEg
Y2FuIG9ubHkgaGF2ZSBhIHNpbmdsZSBkZXZpY2Ugb24gaXQuICBObwpvdGhlciAqX3BjaWVfdmFs
aWRfZGV2aWNlKCkgaW1wbGVtZW50YXRpb25zIGVuZm9yY2UgdGhhdC4gIEl0J3MgdHJ1ZQp0aGF0
IHRyYWRpdGlvbmFsIFBDSWUgZGV2aWNlcyBjYW4gb25seSBpbXBsZW1lbnQgZGV2aWNlIDAwLCBi
dXQgQVJJCnJlbGF4ZXMgdGhhdCBieSByZXVzaW5nIHRoZSBEZXZpY2UgTnVtYmVyIGFzIGV4dGVu
ZGVkIEZ1bmN0aW9uIE51bWJlcgpiaXRzLgoKPiA+IFRoZXJlICppcyogYSB3YXkgZm9yIGEgUENJ
ZSBkZXZpY2UgdG8gc2F5ICJJIG5lZWQgbW9yZSB0aW1lIi4gIEl0IGRvZXMKPiA+IHRoaXMgYnkg
cmVzcG9uZGluZyB0byB0aGF0IFZlbmRvciBJRCBjb25maWcgcmVhZCB3aXRoIFJlcXVlc3QgUmV0
cnkKPiA+IFN0YXR1cyAoUlJTLCBha2EgQ1JTIGluIG9sZGVyIHNwZWNzKSwgd2hpY2ggbWVhbnMg
IkknbSBub3QgcmVhZHkgeWV0LAo+ID4gYnV0IEkgd2lsbCBiZSByZWFkeSBpbiB0aGUgZnV0dXJl
LiIgIEFkZGluZyBhIGRlbGF5IHdvdWxkIGRlZmluaXRlbHkKPiA+IG1ha2UgYSBkaWZmZXJlbmNl
IGhlcmUsIHNvIG15IGd1ZXNzIGlzIHRoaXMgaXMgd2hhdCdzIGhhcHBlbmluZy4KPiA+Cj4gPiBN
b3N0IHJvb3QgY29tcGxleGVzIHJldHVybiB+MCBkYXRhIHRvIHRoZSBDUFUgd2hlbiBhIGNvbmZp
ZyByZWFkCj4gPiB0ZXJtaW5hdGVzIHdpdGggVVIgb3IgUlJTLiAgSXQgc291bmRzIGxpa2Ugcm9j
a2NoaXAgZG9lcyB0aGlzIGZvciBVUgo+ID4gYnV0IHBvc3NpYmx5IG5vdCBmb3IgUlJTLgo+ID4K
PiA+IFRoZXJlIGlzIGEgIlJSUyBTb2Z0d2FyZSBWaXNpYmlsaXR5IiBmZWF0dXJlLCB3aGljaCBp
cyBzdXBwb3NlZCB0bwo+ID4gdHVybiB0aGUgUlJTIGludG8gYSBzcGVjaWFsIHZhbHVlIChWZW5k
b3IgSUQgPT0gMHgwMDAxKSwgYnV0IHBlciBbMV0sCj4gPiByb2NrY2hpcCBkb2Vzbid0IHN1cHBv
cnQgaXQgKGxzcGNpIGNhbGxzIGl0ICJDUlNWaXNpYmxlIikuCj4gPgo+ID4gQnV0IHRoZSBDUFUg
bG9hZCBpbnN0cnVjdGlvbiBjb3JyZXNwb25kaW5nIHRvIHRoZSBjb25maWcgcmVhZCBoYXMgdG8K
PiA+IGNvbXBsZXRlIGJ5IHJlYWRpbmcgKnNvbWV0aGluZyogb3IgZWxzZSBiZSBhYm9ydGVkLiAg
SXQgc291bmRzIGxpa2UKPiA+IGl0J3MgYWJvcnRlZCBpbiB0aGlzIGNhc2UuICBJIGRvbid0IGtu
b3cgdGhlIGFybTY0IGRldGFpbHMsIGJ1dCBpZiB3ZQo+ID4gY291bGQgY2F0Y2ggdGhhdCBhYm9y
dCBhbmQgZGV0ZXJtaW5lIHRoYXQgaXQgd2FzIGFuIFJSUyBhbmQgbm90IGEgVVIsCj4gPiBtYXli
ZSB3ZSBjb3VsZCBmYWJyaWNhdGUgdGhlIG1hZ2ljIFJSUyAweDAwMDEgdmFsdWUuCj4gPgo+ID4g
aW14NnFfcGNpZV9hYm9ydF9oYW5kbGVyKCkgZG9lcyBzb21ldGhpbmcgbGlrZSB0aGF0LCBhbHRo
b3VnaCBJIHRoaW5rCj4gPiBpdCdzIGZvciBhcm0zMiwgbm90IGFybTY0LiAgQnV0IG9idmlvdXNs
eSB3ZSBhbHJlYWR5IGNhdGNoIHRoZSBhYm9ydAo+ID4gZW5vdWdoIHRvIGR1bXAgdGhlIHJlZ2lz
dGVyIHN0YXRlIGFuZCBwYW5pYywgc28gbWF5YmUgdGhlcmUncyBhIHdheSB0bwo+ID4gZXh0ZW5k
IHRoYXQ/Cj4gCj4gUGVyaGFwcyBhIGhvb2sgbWVjaGFuaXNtIHRoYXQgYWxsb3dzIGRyaXZlcnMg
dG8gcmVnaXN0ZXIgd2l0aCB0aGUKPiBzZXJyb3IgaGFuZGxlciBhbmQgb2ZmZXIgdG8gaGFuZGxl
IHNwZWNpZmljIGVycm9ycyBiZWZvcmUgdGhlIGdlbmVyaWMKPiBjb2RlIGNhdXNlcyB0aGUgc3lz
dGVtIHBhbmljPwo+IAo+IFZlcnkgUmVzcGVjdGZ1bGx5LAo+IFBldGVyIEdlaXMKPiAKPiBbMl0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcGNpL0NBTWRZellxbjNMN3gtdmMrX0s2akcw
RVZUaVBHYno4cFEtTjFRMW1SYmNWWEU4MjJZZ0BtYWlsLmdtYWlsLmNvbS8KPiAKPiA+Cj4gPiBC
am9ybgo+ID4KPiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1wY2kvQ0FNZFl6
WXBPRkFWcTMwTitPMmdPeFhpUnRwb0hwYWtGZzNMS3EzVEVacTRTNlkweTBnQG1haWwuZ21haWwu
Y29tLwo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
TGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0Cj4gTGludXgta2VybmVsLW1lbnRlZXNA
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwo+IGh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1h
aWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWtlcm5lbC1tZW50ZWVzCg==
