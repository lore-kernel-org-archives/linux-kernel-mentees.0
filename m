Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C4BC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 10:35:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 963E4206B2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 10:35:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="iihJcLKg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 963E4206B2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 045E987275;
	Tue, 10 Nov 2020 10:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wtzxg5mQ5zXT; Tue, 10 Nov 2020 10:35:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5C4D287242;
	Tue, 10 Nov 2020 10:35:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 358C5C0889;
	Tue, 10 Nov 2020 10:35:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91C77C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 10:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7F8D6868AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 10:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ZfA9S-_ThzZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 10:35:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B98C6868A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 10:35:23 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 30so6263191otx.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 02:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O9J78ygcMCgUaBelKJGuBDpmTHHQsSZqL7xxo9X1FXA=;
 b=iihJcLKgP4TSrgi/XOpJJLxcsC62DsZSrPSTjA7lSmML5YPgIbfpXonIcaUFoZ4xND
 ol7Q40wpQdgn6+48hn4iIVJ6RPMWatx/ll/y5aX3iBAd7l/30optiS9wz43TMfCYv+h2
 3LULW2nv89gzaqh0QYHdlgFn2P0+LzgIU90KRsO6wMHpQ0w8DsUOkkgMf0fXnRBMJxed
 HtTMfxmVjzq/58yo17tXXg3HgGhrb84M40048Zb30zqZibfvPSs5A6k35uGVuJ4lFW8e
 8EoBkoS3jGroVu5o/+71qHhYl/uiJ51xqICPvfWaZ+TSea4oO2tjl6O2lwl0D7vgzrKB
 BI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O9J78ygcMCgUaBelKJGuBDpmTHHQsSZqL7xxo9X1FXA=;
 b=Fnez5bqwqYOY0GlwrcC7JcFtK5qY24X7dY9BvDpM7fpKS+LMDD5tMJDJPejpGA1rWd
 05lvC24gD77M14mkWSNCxLoWrM06X3ieCHQY/Zp+BpQ/g5MKSkCVk/zFE+jd9TgPKh/0
 ar+P5disv64to7sOidtA6Ok1vmHuhZPxfNO9oqYwO8ke9nXvuyXs1naDeKReKjiMGfo+
 XZagawpHORNMyA7LFeTjDZUKgY+aqNXL4E6xTZND599JXFvgis0biVhyNkaJOn0492oz
 BhdXpm/shmWGfkvkdauPsPMyRAsS/vev+++62C/eg0gw91SqwUibOEPwDM20QxEcU4om
 NDbA==
X-Gm-Message-State: AOAM530MI9+1CZKrFQVEvriVx4QF+pMAsqtVzoP5AOWW9Z9Q3sOi3ygM
 DmM2BdD6uiJVqSRlTEWFyj16MvR/E1eCe9OjgjH3CA==
X-Google-Smtp-Source: ABdhPJwnxEs/Uy6X8cWrXNv3gk8aEzJNoK265lQPtFA5Tp98fsZsbenX9qhYvw3oT3pOA4i1EhG2MWTej8+yAivp6AM=
X-Received: by 2002:a9d:f44:: with SMTP id 62mr14385069ott.17.1605004522694;
 Tue, 10 Nov 2020 02:35:22 -0800 (PST)
MIME-Version: 1.0
References: <20201106192154.51514-1-98.arpi@gmail.com>
 <CABVgOSkQ6+y7OGw2494cJa2b60EkSjncLNAgc9cJDbS=X9J3WA@mail.gmail.com>
 <CANpmjNNp2RUCE_ypp2R4MznikTYRYeCDuF7VMp+Hbh=55KWa3A@mail.gmail.com>
 <47a05c5a-485d-026b-c1c3-476ed1a97856@gmail.com>
 <CABVgOSkZ9k6bHPp=LVATWfokMSrEuD87jOfE5MiVYAEbZMmaQQ@mail.gmail.com>
In-Reply-To: <CABVgOSkZ9k6bHPp=LVATWfokMSrEuD87jOfE5MiVYAEbZMmaQQ@mail.gmail.com>
Date: Tue, 10 Nov 2020 11:35:11 +0100
Message-ID: <CANpmjNMzNauQVNKK_ToWDKrwT1LKY7Tb+ApG8drX8wtBkBbWQQ@mail.gmail.com>
To: David Gow <davidgow@google.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v6 1/2] kunit: Support for
	Parameterized Testing
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
From: Marco Elver via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Marco Elver <elver@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gVHVlLCAxMCBOb3YgMjAyMCBhdCAwODoyMSwgRGF2aWQgR293IDxkYXZpZGdvd0Bnb29nbGUu
Y29tPiB3cm90ZToKWy4uLl0KPiA+ID4KPiA+ID4gVGhlIHByZXZpb3VzIGF0dGVtcHQgWzFdIGF0
IHNvbWV0aGluZyBzaW1pbGFyIGZhaWxlZCBiZWNhdXNlIGl0IHNlZW1zCj4gPiA+IHdlJ2QgbmVl
ZCB0byB0ZWFjaCBrdW5pdC10b29sIG5ldyB0cmlja3MgWzJdLCB0b28uCj4gPiA+IFsxXSBodHRw
czovL2xrbWwua2VybmVsLm9yZy9yLzIwMjAxMTA1MTk1NTAzLkdBMjM5OTYyMUBlbHZlci5nb29n
bGUuY29tCj4gPiA+IFsyXSBodHRwczovL2xrbWwua2VybmVsLm9yZy9yLzIwMjAxMTA2MTIzNDMz
LkdBMzU2MzIzNUBlbHZlci5nb29nbGUuY29tCj4gPiA+Cj4gPiA+IFNvIGlmIHdlIGdvIHdpdGgg
YSBkaWZmZXJlbnQgZm9ybWF0LCB3ZSBtaWdodCBuZWVkIGEgcGF0Y2ggYmVmb3JlIHRoaXMKPiA+
ID4gb25lIHRvIG1ha2Uga3VuaXQtdG9vbCBjb21wYXRpYmxlIHdpdGggdGhhdCB0eXBlIG9mIGRp
YWdub3N0aWMuCj4gPiA+Cj4gPiA+IEN1cnJlbnRseSBJIHRoaW5rIHdlIGhhdmUgdGhlIGZvbGxv
d2luZyBwcm9wb3NhbHMgZm9yIGEgZm9ybWF0Ogo+ID4gPgo+ID4gPiAxLiBUaGUgY3VycmVudCAi
IyBbdGVzdF9jYXNlLT5uYW1lXTogcGFyYW0tW2luZGV4XSBbb2t8bm90IG9rXSIgLS0KPiA+ID4g
dGhpcyB3b3JrcyB3ZWxsLCBiZWNhdXNlIG5vIGNoYW5nZXMgdG8ga3VuaXQtdG9vbCBhcmUgcmVx
dWlyZWQsIGFuZCBpdAo+ID4gPiBhbHNvIHBpY2tzIHVwIHRoZSBkaWFnbm9zdGljIGNvbnRleHQg
Zm9yIHRoZSBjYXNlIGFuZCBkaXNwbGF5cyB0aGF0IG9uCj4gPiA+IHRlc3QgZmFpbHVyZS4KPiA+
ID4KPiA+ID4gMi4gWW91ciBwcm9wb3NlZCAiIyBbb2t8bm90IG9rXSAtIFt0ZXN0X2Nhc2UtPm5h
bWVdOnBhcmFtLVtpbmRleF0iLgo+ID4gPiBBcy1pcywgdGhpcyBuZWVkcyBhIHBhdGNoIGZvciBr
dW5pdC10b29sIGFzIHdlbGwuIEkganVzdCBjaGVja2VkLCBhbmQKPiA+ID4gaWYgd2UgY2hhbmdl
IGl0IHRvICIjIFtva3xub3Qgb2tdIC0gW3Rlc3RfY2FzZS0+bmFtZV06IHBhcmFtLVtpbmRleF0i
Cj4gPiA+IChub3RlIHRoZSBzcGFjZSBhZnRlciAnOicpIGl0IHdvcmtzIHdpdGhvdXQgY2hhbmdp
bmcga3VuaXQtdG9vbC4gOy0pCj4gPiA+Cj4gPiA+IDMuIFNvbWV0aGluZyBsaWtlICIjIFtva3xu
b3Qgb2tdIHBhcmFtLVtpbmRleF0gLSBbdGVzdF9jYXNlLT5uYW1lXSIsCj4gPiA+IHdoaWNoIEkg
aGFkIHBsYXllZCB3aXRoIGVhcmxpZXIgYnV0IGt1bml0LXRvb2wgaXMgZGVmaW5pdGVseSBub3Qg
eWV0Cj4gPiA+IGhhcHB5IHdpdGguCj4gPiA+Cj4gPiA+IFNvIG15IGN1cnJlbnQgcHJlZmVyZW5j
ZSBpcyAoMikgd2l0aCB0aGUgZXh0cmEgc3BhY2UgKG5vIGNoYW5nZSB0bwo+ID4gPiBrdW5pdC10
b29sIHJlcXVpcmVkKS4gV0RZVD8KPiA+ID4KPgo+IEhtbeKApiB0aGF0IGZhaWx1cmUgaW4ga3Vu
aXRfdG9vbCBpcyBkZWZpbml0ZWx5IGEgYnVnOiB3ZSBzaG91bGRuJ3QgY2FyZQo+IHdoYXQgY29t
ZXMgYWZ0ZXIgdGhlIGNvbW1lbnQgY2hhcmFjdGVyIGV4Y2VwdCBpZiBpdCdzIGFuIGV4cGxpY2l0
Cj4gc3VidGVzdCBkZWNsYXJhdGlvbiBvciBhIGNyYXNoLiBJJ2xsIHRyeSB0byBwdXQgYSBwYXRj
aCB0b2dldGhlciB0bwo+IGZpeCBpdCwgYnV0IEknZCByYXRoZXIgbm90IGRlbGF5IHRoaXMganVz
dCBmb3IgdGhhdC4KPgo+IEluIGFueSB0aG91Z2h0IGFib3V0IHRoaXMgYSBiaXQgbW9yZSwgSXQg
dHVybnMgb3V0IHRoYXQgdGhlIHByb3Bvc2VkCj4gS1RBUCBzcGVjWzFdIGRpc2NvdXJhZ2VzIHRo
ZSB1c2Ugb2YgJzonLCBleGNlcHQgYXMgcGFydCBvZiBhIHN1YnRlc3QKPiBkZWNsYXJhdGlvbiwg
b3IgcGVyaGFwcyBhbiBhcy15ZXQtdW5zcGVjaWZpZWQgZnVsbHktcXVhbGlmaWVkIHRlc3QKPiBu
YW1lLiBUaGUgbGF0dGVyIGlzIHdoYXQgSSB3YXMgZ29pbmcgZm9yLCBidXQgaWYgaXQncyBhY3Rp
dmVseQo+IGJyZWFraW5nIGt1bml0X3Rvb2wsIHdlIG1pZ2h0IHdhbnQgdG8gaG9sZCBvZmYgb24g
aXQuCj4KPiBJZiB3ZSB3ZXJlIHRvIHRyeSB0byB0cmVhdCB0aGVzZSBhcyBzdWJ0ZXN0cyBpbiBh
Y2NvcmRhbmNlIHdpdGggdGhhdAo+IHNwZWMsIHRoZSB3YXkgd2UnZCB3YW50IHRvIHVzZSBvbmUg
b2YgdGhlc2Ugb3B0aW9uczoKPiBBKSAiW29rfG5vdCBva10gW2luZGV4XSAtIHBhcmFtLVtpbmRl
eF0iIC0tIFRoaXMgZG9lc24ndCBtZW50aW9uIHRoZQo+IHRlc3QgY2FzZSBuYW1lLCBidXQgb3Ro
ZXJ3aXNlIHRyZWF0cyB0aGluZ3MgZXhhY3RseSB0aGUgc2FtZSB3YXkgd2UKPiB0cmVhdCBleGlz
dGluZyBzdWJ0ZXN0cy4KPgo+IEIpICJbb2t8bm90IG9rXSBbaW5kZXhdIC0gW3Rlc3RfY2FzZS0+
bmFtZV0iIC0tIFRoaXMgZG9lc24ndCBuYW1lIHRoZQo+ICJzdWJ0ZXN0IiwganVzdCBnaXZlcyBy
ZXBlYXRlZCByZXN1bHRzIHdpdGggdGhlIHNhbWUgbmFtZS4KPgo+IEMpICJbb2t8bm90IG9rXSBb
aW5kZXhdIC0gW3Rlc3RfY2FzZS0+bmFtZV1bc2VwYXJhdG9yXXBhcmFtLVtpbmRleF0iCj4gLS0g
VGhpcyBpcyBlcXVpdmFsZW50IHRvIG15IHN1Z2dlc3Rpb24gd2l0aCBhIHNlcGFyYXRvciBvZiAi
OiIsIG9yIDIKPiBhYm92ZSB3aXRoIGEgc2VwYXJhdG9yIG9mICI6ICIuIFRoZSBpbi1wcm9ncmVz
cyBzcGVjIGRvZXNuJ3QgeWV0Cj4gc3BlY2lmeSBob3cgdGhlc2UgZnVsbHktcXVhbGlmaWVkIG5h
bWVzIHdvdWxkIHdvcmssIG90aGVyIHRoYW4gdGhhdAo+IHRoZXknZCB1c2UgYSBjb2xvbiBzb21l
d2hlcmUsIGFuZCBpZiB3ZSBjb21tZW50IGl0IG91dCwgIjogIiBpcwo+IHJlcXVpcmVkLgo+Cj4g
Pgo+ID4gV2hpY2ggZm9ybWF0IGRvIHdlIGZpbmFsbHkgZ28gd2l0aD8KPiA+Cj4KPiBJJ20gYWN0
dWFsbHkgZ29pbmcgdG8gbWFrZSBhbm90aGVyIHdpbGQgc3VnZ2VzdGlvbiBmb3IgdGhpcywgd2hp
Y2ggaXMKPiBhIGNvbWJpbmF0aW9uIG9mICgxKSBhbmQgKEEpOgo+ICIjIFt0ZXN0X2Nhc2UtPm5h
bWVdOiBbb2t8bm90IG9rXSBbaW5kZXhdIC0gcGFyYW0tW2luZGV4XSIKPgo+IFRoaXMgZ2l2ZXMg
dXMgYSBLVEFQLWNvbXBsaWFudCByZXN1bHQgbGluZSwgZXhjZXB0IHByZXBlbmRlZCB3aXRoICIj
Cj4gW3Rlc3RfY2FzZS0+bmFtZV06ICIsIHdoaWNoIG1ha2VzIGl0IGZvcm1hbGx5IGEgZGlhZ25v
c3RpYyBsaW5lLAo+IHJhdGhlciB0aGFuIGFuIGFjdHVhbCBzdWJ0ZXN0LiBQdXR0aW5nIHRoZSB0
ZXN0IG5hbWUgYXQgdGhlIHN0YXJ0Cj4gbWF0Y2hlcyB3aGF0IGt1bml0X3Rvb2wgaXMgZXhwZWN0
aW5nIGF0IHRoZSBtb21lbnQuIElmIHdlIHRoZW4gd2FudCB0bwo+IHR1cm4gaXQgaW50byBhIHBy
b3BlciBzdWJ0ZXN0LCB3ZSBjYW4ganVzdCBnZXQgcmlkIG9mIHRoYXQgcHJlZml4IChhbmQKPiBh
ZGQgdGhlIGFwcHJvcHJpYXRlIGNvdW50cyBlbHNld2hlcmUpLgo+Cj4gRG9lcyB0aGF0IHNvdW5k
IGdvb2Q/CgpTb3VuZHMgcmVhc29uYWJsZSB0byBtZSEgIFRoZSByZXBldGl0aW9uIG9mIFtpbmRl
eF0gc2VlbXMgdW5uZWNlc3NhcnkKZm9yIG5vdywgYnV0IEkgdGhpbmsgaWYgd2UgYXQgc29tZSBw
b2ludCBoYXZlIGEgd2F5IHRvIGdldCBhIHN0cmluZwpyZXByZXNlbnRhdGlvbiBvZiBhIHBhcmFt
LCB3ZSBjYW4gc3Vic3RpdHV0ZSBwYXJhbS1baW5kZXhdIHdpdGggYQpzdHJpbmcgdGhhdCByZXBy
ZXNlbnRzIHRoZSBwYXJhbS4KCk5vdGUgdGhhdCBvbmNlIHdlIHdhbnQgdG8gbWFrZSBpdCBhIHJl
YWwgc3VidGVzdCwgd2UnZCBuZWVkIHRvIHJ1biB0aGUKZ2VuZXJhdG9yIHR3aWNlLCBvbmNlIHRv
IGdldCB0aGUgbnVtYmVyIG9mIHBhcmFtcyBhbmQgdGhlbiB0byBydW4gdGhlCnRlc3RzLiBJZiB3
ZSByZXF1aXJlIHRoYXQgcGFyYW0gZ2VuZXJhdG9ycyBhcmUgZGV0ZXJtaW5pc3RpYyBpbiB0aGUK
bnVtYmVyIG9mIHBhcmFtcyBnZW5lcmF0ZWQsIHRoaXMgaXMgbm90IGEgcHJvYmxlbS4KClRoYW5r
cywKLS0gTWFyY28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVz
QGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
