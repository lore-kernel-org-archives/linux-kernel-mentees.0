Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E0BC001DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Jul 2023 15:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFFE781926;
	Sun, 30 Jul 2023 15:11:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFFE781926
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=iVajQlqw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b2oJFxzsDPcg; Sun, 30 Jul 2023 15:11:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BCD00817AD;
	Sun, 30 Jul 2023 15:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCD00817AD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6808C0071;
	Sun, 30 Jul 2023 15:11:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA8B6C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 15:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76EEA405F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 15:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76EEA405F4
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=iVajQlqw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MK1vCyyRrlE3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 15:11:26 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A858340280
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 15:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A858340280
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1690729863; x=1691334663; i=markus.elfring@web.de;
 bh=iVqhpr2xU5V1OM9omgS2O0eQ0bIJpJyzYZoTLor0VVg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=iVajQlqwr2uGECPjBX+s4U1KIT3oir+k9TrkZFbYYlbRjWeLkR0l51Hev15wJSyt0Fm4ZVL
 9gf4n82kZUkd0F7WkxTywk7BF4w3QVWj3uXquCRdu1qAHYrx06prSpyRKcD/jBX2LOCioECu7
 m0IwNJ2v+F3Qet/o7M9NMqxYWYHodaw3J7myJJ2YYNihYfhzkB+/BgCNWnZZDC/DM8YdP+j6w
 dF9fhId7MG7/EB+f12cNR4Ik3NUxOEmCpeKcb3Vn4rKrqkb6A74LYDi0R5Jj8TZeEnlfl8yFJ
 55V6fzbkFiWA1ascoE/vVOGhYRpQb56xLy7gzpgwa/n+J4cav7uw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MOUxo-1qDNqj25cc-00Q41P; Sun, 30
 Jul 2023 17:11:03 +0200
Message-ID: <ad4a370a-3441-1d8c-af3a-97ab29272b6e@web.de>
Date: Sun, 30 Jul 2023 17:11:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [v5] selftests: rtc: Improve rtctest error handling
Content-Language: en-GB
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kselftest@vger.kernel.org, linux-rtc@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20230722060706.79759-1-atulpant.linux@gmail.com>
 <9d51f21d-04e8-3dd2-91b9-9ab0cf848760@web.de>
 <2023073058-uncurled-leverage-4045@gregkh>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <2023073058-uncurled-leverage-4045@gregkh>
X-Provags-ID: V03:K1:Z3jt5y1eUSS3kG4dROw9SYpaP1nUo5Q7SV7OzipzTY5owuIH7VP
 XpiRaIJ9LNWNULXm73NHexDk5TeHIznZy0ScANWNNS9iWGjxon4LBHh15bPw+u5HKFWRLQ2
 D/S7eafAwBsbA9hxwYX3tYcQiErCVgTUikFwAL0VAjp+qFpxSq7wvUe8vcStpZhhS1d5+3e
 meJcjYJmr34oAtbMS+JzA==
UI-OutboundReport: notjunk:1;M01:P0:mNZOCkaQo8I=;kpD66K8N4OttbvfrS6DD3JA6hRx
 iT8fkG10xttUBZ4NkMzmcjF9PLNBMFfR+rPLzp6HmQHyFn342R5djXSjj7Jxt+4c64sFP6MnE
 G6xrtuGQbI69dsbxY+qToM7zRAivSLnB/p2EUEn1PamojzMG0fYIIo/MC7v9h2u6p1GqwRyRB
 iW7EvD1+pHV3rsdCxFc8YUKPmOhN6pIcqUYFncicYY8plU6YrMJI0LC+q6E3p8DgCWyDFcNMr
 QBghapprLCzT6Vext8hwSAyOjDE/bImFzNz6Cj++co9UyCe0d29cU8v6UU1QC1KV6o/KvRiQD
 LWykzu1GSEYTpXqVKVsD/UVi1XqLThrPTnyPd5kqkUmiO1IDZJKiUusMUvlwgR5+BgChEcRDz
 v0vBswvskw/cVnGmtwORuSrLai43ZJQ4rOVecWsc7O8bfz5bMTgdvkN7ojhfcLTSnu6KVvMrv
 UlTOzfBHHvOLmdtRpg3B5/+G0rdhH1AcMqJl7qBWbyDI3caBcDROV5VkSTa0lbKx9LG4k5qjy
 /jQfvGnKD1S/2nMO6hBAbq/nJLh6kua9wwB9CS/6rCE06XNECtVFdcZYS66ev7bXIJ0SmlkgX
 acOLd68NYU9mIvOPkOIBGReUKJ3R7PXoGp7299QRjydLAIFnR21YXTxE87zADfVPUkvPkqGbd
 uA1tB+duNnyj/83uNP6wh3MR/e+FB6n+Q8ypbXYjK7/4L9b16VtNsQpxOLrRaXap1lYhPvcr5
 XilUg198+0ypBaVbyzUnlX0hZh7zUHwAQVT5ba6ydflYkqUs8M6qGapin3lq1fW7xp8biNb8o
 BJA9ZgnmGtO9ftzBhdno9re1DGsgUJy7uzHRqq9yk1tNHH5ZbM7V5ZCiS9FyOxx5wqLFoG1MY
 qHyKJ38mGxiDwPRLvSyiCDEgMQ6ESTV8R2jAK3IUj9z5GIkZcuPIsrdDABJaZBeWgpKmRDa6/
 bcI+bg==
Cc: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Atul Kumar Pant <atulpant.linux@gmail.com>, Shuah Khan <shuah@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
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

PiBUaGlzIGlzIHRoZSBzZW1pLWZyaWVuZGx5IHBhdGNoLWJvdCBvZiBHcmVnIEtyb2FoLUhhcnRt
YW4uCgpJIGhvcGUgdGhhdCB0aGUg4oCcaW50ZWxsaWdlbmNl4oCdIGNhbiBiZSBpbXByb3ZlZCBh
bHNvIGZvciB0aGlzIHNvZnR3YXJlIGNvbXBvbmVudC4KCgo+IE1hcmt1cywgeW91IHNlZW0gdG8g
aGF2ZSBzZW50IGEgbm9uc2Vuc2ljYWwgb3Igb3RoZXJ3aXNlIHBvaW50bGVzcwo+IHJldmlldyBj
b21tZW50IHRvIGEgcGF0Y2ggc3VibWlzc2lvbiBvbiBhIExpbnV4IGtlcm5lbCBkZXZlbG9wZXIg
bWFpbGluZyBsaXN0LgrigKYKClRoaXMgYXV0b21hdGVkIHJlc3BvbnNlIGlzIGEgcXVlc3Rpb25h
YmxlIHNpZGUgZWZmZWN0IG9mIGtub3duCnJlY3VycmluZyBjb21tdW5pY2F0aW9uIGRpZmZpY3Vs
dGllcywgaXNuJ3QgaXQ/CgoKPiBQYXRjaCBzdWJtaXR0ZXIsIHBsZWFzZSBpZ25vcmUgTWFya3Vz
J3Mgc3VnZ2VzdGlvbjsgeW91IGRvIG5vdCBuZWVkIHRvCj4gZm9sbG93IGl0IGF0IGFsbC4K4oCm
CgpJIGhvcGUgdGhhdCB0aGlzIHJlcXVlc3Qgd2lsbCBiZSByZWNvbnNpZGVyZWQgaW4gbW9yZSBk
ZXRhaWwKZXNwZWNpYWxseSB3aGVuIG15IGNoYW5nZSBzdWdnZXN0aW9ucyBjYW4gYmUgaW50ZXJw
cmV0ZWQgYXMgcmVtaW5kZXJzCmZyb20gdGhlIExpbnV4IGRldmVsb3BtZW50IGRvY3VtZW50YXRp
b24gZm9yIGEgZGlzY3Vzc2VkIHBhdGNoLgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL3By
b2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdD9oPXY2LjUtcmMzI24zCgpXaWxsIHRoZSBjaGFu
Y2VzIGV2ZXIgZ3JvdyB0byByZXNvbHZlIGFmZmVjdGVkIGFzcGVjdHMgaW4gbW9yZSBjb25zdHJ1
Y3RpdmUgd2F5cz8KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGlu
dXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVl
cwo=
