Return-Path: <SRS0=QZ3P=DR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BE1C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 18:16:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40C7F224D4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 18:16:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PO3hbo57"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40C7F224D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 14B618741B;
	Sat, 10 Oct 2020 18:16:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3aRqEuB8uOMd; Sat, 10 Oct 2020 18:16:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A1DB38741A;
	Sat, 10 Oct 2020 18:16:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 964A1C07FF;
	Sat, 10 Oct 2020 18:16:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D5A2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 18:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1131820515
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 18:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XXWAdlegxEjX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 18:16:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 48158204ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 18:16:48 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74275224D2;
 Sat, 10 Oct 2020 18:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602353807;
 bh=sLoHu4Fmfk0Nq0w8TdeuFODgOJ4sZF27hA5hc3Z4lxM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PO3hbo570m8zLVc7tkeR02Z1xJ24W0DnKQpgawOGaNATo0sOHXDeWP2OK9NT+xIX3
 Ylkj4e/s9IuCBXVlqUiVavK4xH84UKtgxeSNw4UFL9Ji7t6g9z5Z0onpZOs9SumNNz
 ivOmZIqbqR+0EqtyMggbvqSRPqhe6lALjfKrHhJs=
Date: Sat, 10 Oct 2020 11:16:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <20201010111645.334647af@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <0de8e509-7ca5-7faf-70bf-5880ce0fc15c@gmail.com>
References: <20201010064459.6563-1-anant.thazhemadam@gmail.com>
 <20201010095302.5309c118@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <0de8e509-7ca5-7faf-70bf-5880ce0fc15c@gmail.com>
MIME-Version: 1.0
Cc: Petko Manolov <petkan@nucleusys.com>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] net: usb: rtl8150: don't
 incorrectly assign random MAC addresses
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

T24gU2F0LCAxMCBPY3QgMjAyMCAyMzozNDo1MSArMDUzMCBBbmFudCBUaGF6aGVtYWRhbSB3cm90
ZToKPiBPbiAxMC8xMC8yMCAxMDoyOSBwbSwgSmFrdWIgS2ljaW5za2kgd3JvdGU6Cj4gPiBPbiBT
YXQsIDEwIE9jdCAyMDIwIDEyOjE0OjU5ICswNTMwIEFuYW50IFRoYXpoZW1hZGFtIHdyb3RlOiAg
Cj4gPj4gZ2V0X3JlZ2lzdGVycygpIGRpcmVjdGx5IHJldHVybnMgdGhlIHJldHVybiB2YWx1ZSBv
Zgo+ID4+IHVzYl9jb250cm9sX21zZ19yZWN2KCkgLSAwIGlmIHN1Y2Nlc3NmdWwsIGFuZCBuZWdh
dGl2ZSBlcnJvciBudW1iZXIgCj4gPj4gb3RoZXJ3aXNlLiAgCj4gPiBBcmUgeW91IGV4cGVjdGlu
ZyBHcmVnIHRvIHRha2UgdGhpcyBhcyBhIHBhcnQgb2Ygc29tZSBVU0Igc3Vic3lzdGVtCj4gPiBj
aGFuZ2VzPyBJIGRvbid0IHNlZSB1c2JfY29udHJvbF9tc2dfcmVjdigpIGluIG15IHRyZWUsIGFu
ZCB0aGUKPiA+IHNlbWFudGljcyBvZiB1c2JfY29udHJvbF9tc2coKSBhcmUgbm90IHdoYXQgeW91
IGRlc2NyaWJlZC4gIAo+IAo+IE5vLCBJJ20gbm90LiB1c2JfY29udHJvbF9tc2dfcmVjdigpIGlz
IGFuIEFQSSB0aGF0IHdhcyByZWNlbnRseQo+IGludHJvZHVjZWQsIGFuZCBnZXRfcmVnaXN0ZXJz
KCkgaW4gcnRsODE1MC5jIHdhcyBhbHNvIG1vZGlmaWVkIHRvCj4gdXNlIGl0IGluIG9yZGVyIHRv
IHByZXZlbnQgcGFydGlhbCByZWFkcy4KPiAKPiBCeSB5b3VyIHRyZWUsIEkgYXNzdW1lIHlvdSBt
ZWFuCj4gwqDCoMKgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2t1YmEvbGludXguZ2l0Lwo+IChpdCB3YXMgdGhlIG9ubHkgb25lIEkgY291bGQgZmluZCku
Cj4gCj4gSSBkb24ndCBzZWUgdGhlIGNvbW1pdCB0aGF0IHRoaXMgcGF0Y2ggaXMgc3VwcG9zZWQg
dG8gZml4IGluIHlvdXIKPiB0cmVlIGVpdGhlci4uLiA6Lwo+IAo+IE5vbmV0aGVsZXNzLCB0aGlz
IGNvbW1pdCBmaXhlcyBhbiBpc3N1ZSB0aGF0IHdhcyBhcHBsaWVkIHRvIHRoZQo+IG5ldHdvcmtp
bmcgdHJlZSwgYW5kIGhhcyBtYWRlIGl0cyB3YXkgaW50byBsaW51eC1uZXh0IGFzIHdlbGwsIGlm
Cj4gSSdtIG5vdCBtaXN0YWtlbi4KCkkgbWVhbiB0aGUgbmV0d29ya2luZyB0cmVlLCB3aGF0J3Mg
dGhlIGNvbW1pdCBJRCBpbiBsaW51eC1uZXh0PwoKWW91ciBmaXhlcyB0YWcgcG9pbnRzIHRvIGY0
NWE0MjQ4ZWE0YywgYnV0IGxvb2tzIGxpa2UgdGhlIGNvZGUgd2FzCnF1aXRlIGNvcnJlY3QgYXQg
dGhhdCBwb2ludC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVz
QGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
