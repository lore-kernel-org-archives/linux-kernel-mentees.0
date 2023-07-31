Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D802C001DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Jul 2023 05:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23F3B6103F;
	Mon, 31 Jul 2023 05:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23F3B6103F
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=B46IA+ut
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Momgb3w2E-Ra; Mon, 31 Jul 2023 05:40:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D52F360FAE;
	Mon, 31 Jul 2023 05:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D52F360FAE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F86EC0072;
	Mon, 31 Jul 2023 05:40:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64B90C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 05:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38C5F4095E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 05:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38C5F4095E
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=B46IA+ut
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W1HCL2R8JSTL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 05:40:54 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 655004095C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 05:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 655004095C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1690782029; x=1691386829; i=markus.elfring@web.de;
 bh=C0urstc3R4R0ZtP+R9Xk08vxkkp+Wy58E8MDAJFcLEc=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=B46IA+ut03uMjr4NgajUEj6UclN9A4SDG6a8+ltWiCAsEbwE40HemIfooGD/6i8oTOBsStd
 GzZvktPIEAmYsmpsPV9+r0ozU4Ew0JyLUO/iPog3CgCcQicz8O0WAq0jThQmLF3BFmqKYXHhQ
 v6lluKIJZf0NEFDbGND1zAaDcfzzMKXWVemmSGBnlQAgoVuULkD0X4JS3Xm/7+hRNzrHoBTl/
 QU6+T9gAEXicMKUumUK7qHB0uLU01Q/lCTVuWcag3kE71dn+96WX9ZpYJAmbdlsIKTIPtL34t
 4A0IvnZOVVWYt2rKUCwW5IlLDWUoUMbHY0dSAfFxVlt+C0zsKulw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MActo-1qbNCf1tHs-00B8wE; Mon, 31
 Jul 2023 07:40:29 +0200
Message-ID: <8b6229da-ca60-f352-f374-47f9b6d33862@web.de>
Date: Mon, 31 Jul 2023 07:40:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
To: Atul Raut <rauji.raut@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Wang Ming <machel@vivo.com>
References: <20230731024542.27248-1-rauji.raut@gmail.com>
Subject: Re: [PATCH] ath6kl: Fix debugfs_create_dir error checking
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230731024542.27248-1-rauji.raut@gmail.com>
X-Provags-ID: V03:K1:l2shhFIykZUfmH4iY42bCdo92S5RcswSIPLkJC0lVCkUy4F53x1
 nWrvZv7OWxqSxwTbqBGFYBJgNi+mP/i0tBe4qJ6+vIh6LEdhq7Y2PabDhYwlFaJVseXsdc/
 6+JaxVC+uV/LdnTiEEZ+EH3lTsYOQ8TSM9m/X+44afexexXSqXoBKVuHTi86Yhg1qR3vBEs
 ylFU75hEIPWPsHCEhlgLQ==
UI-OutboundReport: notjunk:1;M01:P0:tWFhG2ocN7c=;KhX2mSOJEnHiLTDEry9taOecUEW
 qn5gTj9jTS8eMFEweJtO11IbNFMH3KHhqsHIrk1oDjSceDmZR/JK71xdPPxfuxntd28sitbZ2
 8f/P3CadtedYizK6UOyRO4AoPI+92VpHlDThX2TmF/LWrKv29zJIB76AdSL9reu0m5bmYDrgC
 bev2FHrgKAWu5MXygCqjWjRc06m4D957BcvNhxNr7A68ElwW1JgBB0cIIiKmqwcoHWSD81JNh
 qIzm/zTj2BpP0TCT9JimVNz8Xz6xGXIjMof6faq+2xgLIe1frCSrzC3UcL8oBLdrIRVoPQE1S
 9P0Yn/mzZSnoajxQF2VV0kiF0OEv+fPJz3rvi0Pwk56/v7Oc4SCCsDCubJ8xHJ+kN1Dao0VAT
 Z/n7zeTQxWu2hSU6n8zmUXuPlnlosLoJZSoQm5FTldBXuFj16r/Qpq3iNb5zCJFKhQ/LDT8Jm
 SuD7YGccqf8oFI2lX3D0ZBTBZ7w4N43JPbl48t+XDmS8LJobP3Y98bfvuhKo+HTCAi4EKCeda
 N8q1Rnjnz4s+fSTl1iVsc6JRC5GOATlatodxDpmyIBqLAjjVME/jZHTpxBRWgKEUERDpz3091
 uDrDc3N00qDteA7EYiTLsD22f+9QP2sziPgGVxjz0VaKzwvi7+AWv+Bcnx5C0dKsp/W/IaeH8
 r+U2OKw1SCBkvhH3gd9WlAUjg5k9/iRS6Juh7uMwYPxVRslK13sEf/q4He02qHw0vqHQv3MMv
 AAn1NmGNTzrrX7IoOZdeQJK3nBpv0LoVG+b1Jvio/jL/axz7X9VIn7bA9UM+hqcqf41XcGiRQ
 LTbm1sbLsunOwn1Xb4LO4Lq9NTE/kbjt9y5sdEcz28OCxZQx5S2fPXQGyRHXOfX4dEFqkqc7r
 U113iBHLDHS37dc0+kVS1n9PkwIHQglZDAsyWkdFLha8UrVm9L0EMuP7vHmpFBpDZHTWqDrOv
 P+Nx3g==
Cc: opensource.kernel@vivo.com, LKML <linux-kernel@vger.kernel.org>,
 Minjie Du <duminjie@vivo.com>
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

4oCmCj4gVGhpcyBpc3N1ZSB3YXMgZm91bmQgd2l0aCB0aGUgaGVscCBvZiBDb2NjaW5lbGxlLgo+
IC4vZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDZrbC9kZWJ1Zy5jOjE3OTY6Ni0yMTogV3Jv
bmcgZGVidWdmcyBjYWxsIGVycm9yIHByb2Nlc3Npbmcgb24gbGluZSAxNzk2CgpXb3VsZCB5b3Ug
bGlrZSB0byBjb21wYXJlIHRoaXMgY2hhbmdlIGFwcHJvYWNoIHdpdGggYSBwcmV2aW91cyBjb250
cmlidXRpb24/CgpbUEFUQ0ggbmV0LW5leHQgdjRdIHdpZmk6IGF0aDZrbDogUmVtb3ZlIGVycm9y
IGNoZWNraW5nIGZvciBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoKQpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9sa21sLzIwMjMwNzI2MTExMjA5LjQwOTYtMS1tYWNoZWxAdml2by5jb20vCmh0dHBzOi8vbGtt
bC5vcmcvbGttbC8yMDIzLzcvMjYvNjI1PwoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1h
aWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWtlcm5lbC1tZW50ZWVzCg==
