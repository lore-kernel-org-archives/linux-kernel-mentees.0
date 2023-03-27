Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E235C7619A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Mar 2023 08:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEF3C81D5A;
	Mon, 27 Mar 2023 08:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEF3C81D5A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZRcIc4ct
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bwFPc1JtikxV; Mon, 27 Mar 2023 08:00:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2155681D4D;
	Mon, 27 Mar 2023 08:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2155681D4D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF206C008C;
	Mon, 27 Mar 2023 08:00:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 656F4C0091
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Mar 2023 08:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33B1D40A5D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Mar 2023 08:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33B1D40A5D
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=ZRcIc4ct
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f79A1Jc-kW6m
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Mar 2023 08:00:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A70184057F
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A70184057F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Mar 2023 08:00:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 958A761046;
 Mon, 27 Mar 2023 08:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46478C433EF;
 Mon, 27 Mar 2023 08:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679904008;
 bh=uFY69oHQbQUzDGw86QdQ180TfEErZH0YMPUJ07jxJFg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZRcIc4ctCcAZ7ynVjGR+chP8P1YkCb5VfA6SuIq5+HhunxSx519jS2al14O2J4/Ta
 3hFzkahiLAVPV5wXJUruqnPVCKCevCR7gJ+ozxWlaZKeZnnThpTAQqWGLD6MxyGamG
 gH2bv119c1CuWGCTmW6a33JM7yqNZhHlLpgrHu/CquB36EFVUOT09bTcWcoEKi8x4e
 RJgM7kJVYEPgU7qUOjNd/QkszFicuc0PuE+oQJxCMJSSbErBoCoZLZpm3oAT+ZT4j0
 YejUnocp4mBoGEvnMeFY+epxupYGqQp7EYlGcnyOJe/HAWERG9QGYQ4nRXD+luT8sd
 w5x2REE0s5Nhg==
Date: Mon, 27 Mar 2023 10:00:04 +0200
From: Christian Brauner <brauner@kernel.org>
To: Anh Tuan Phan <tuananhlfc@gmail.com>
Subject: Re: [PATCH v2 1/1] selftests mount: Fix mount_setattr_test builds
 failed
Message-ID: <20230327080004.7iqrbp3ja2osrq5z@wittgenstein>
References: <ZByVac3GsD7RFuaj@do-x1extreme>
 <20230324021415.17416-1-tuananhlfc@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230324021415.17416-1-tuananhlfc@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, shuah@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, sforshee@kernel.org
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

T24gRnJpLCBNYXIgMjQsIDIwMjMgYXQgMDk6MTQ6MTVBTSArMDcwMCwgQW5oIFR1YW4gUGhhbiB3
cm90ZToKPiBXaGVuIGNvbXBpbGluZyBzZWxmdGVzdHMgd2l0aCB0YXJnZXQgbW91bnRfc2V0YXR0
ciBJIGVuY291bnRlcmVkIHNvbWUgZXJyb3JzIHdpdGggdGhlIGJlbG93IG1lc3NhZ2VzOgo+IG1v
dW50X3NldGF0dHJfdGVzdC5jOiBJbiBmdW5jdGlvbiDigJhtb3VudF9zZXRhdHRyX3RocmVhZOKA
mToKPiBtb3VudF9zZXRhdHRyX3Rlc3QuYzozNDM6MTY6IGVycm9yOiB2YXJpYWJsZSDigJhhdHRy
4oCZIGhhcyBpbml0aWFsaXplciBidXQgaW5jb21wbGV0ZSB0eXBlCj4gICAzNDMgfCAgICAgICAg
IHN0cnVjdCBtb3VudF9hdHRyIGF0dHIgPSB7Cj4gICAgICAgfCAgICAgICAgICAgICAgICBefn5+
fn5+fn5+Cj4gCj4gVGhlc2UgZXJyb3JzIG1pZ2h0IGJlIGJlY2F1c2Ugb2YgbGludXgvbW91bnQu
aCBpcyBub3QgaW5jbHVkZWQuIFRoaXMgcGF0Y2ggcmVzb2x2ZXMgdGhhdCBpc3N1ZS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbmggVHVhbiBQaGFuIDx0dWFuYW5obGZjQGdtYWlsLmNvbT4KPiAtLS0K
CkkgdGhpbmsgU2V0aCBhbHJlYWR5IGFja2VkIHRoaXMuIFRoaXMgY2FuIGdvIHZpYSB0aGUgc2Vs
ZnRlc3QgdHJlZSwKQWNrZWQtYnk6IENocmlzdGlhbiBCcmF1bmVyIDxicmF1bmVyQGtlcm5lbC5v
cmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
