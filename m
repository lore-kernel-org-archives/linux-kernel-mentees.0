Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E2FC001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Jul 2023 10:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D989960A9B;
	Sun, 30 Jul 2023 10:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D989960A9B
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=qqaZsrU9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UsPZluckIOdt; Sun, 30 Jul 2023 10:09:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AC2B860899;
	Sun, 30 Jul 2023 10:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC2B860899
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DCB4C0072;
	Sun, 30 Jul 2023 10:09:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC34FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 10:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0E8460A5D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 10:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0E8460A5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ABBSq8RIdaBD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 10:09:07 +0000 (UTC)
X-Greylist: delayed 474 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 30 Jul 2023 10:09:06 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6375260899
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6375260899
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 10:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1690711742; x=1691316542; i=markus.elfring@web.de;
 bh=CX/B/MeZ843adhESSje5741wWPBoC1SPBe/UCBqFXfY=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=qqaZsrU9ASkT10hOawhaO+E0y8agwPyNJZeTRqFgleCjQqWfui9RTgN3nfVaAy+BJI2M/8v
 BQM8yM9J7iTKw+QZjpXTmXl8yitr4kHx/+o1JwdHAAhd5AIBBFNM4ssGJ5IdRro9YXFdio1Ca
 5UYYUWjW9xNsfPPcqHfREFFeBVHaYvTbffSVWHk5ZwMNjVX3FM7dVeqcSNSVt89q3pSRtRHOr
 x8f/1ieWsWrnWmwLCNSNF6TzQP+rvhKs3yTwx2z4Non59GE8rTm1ziB2JiS1mPtxELJArM0Eu
 CXRo1k0vRE9pYRdcBkFRKuBKXZYbDcYAqCFtwd0skGGeq83BjLOA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MgANA-1pvvr934dq-00hSDz; Sun, 30
 Jul 2023 11:55:33 +0200
Message-ID: <9d51f21d-04e8-3dd2-91b9-9ab0cf848760@web.de>
Date: Sun, 30 Jul 2023 11:55:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
To: Atul Kumar Pant <atulpant.linux@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kselftest@vger.kernel.org, linux-rtc@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Shuah Khan <shuah@kernel.org>
References: <20230722060706.79759-1-atulpant.linux@gmail.com>
Subject: Re: [PATCH v5] selftests: rtc: Improve rtctest error handling
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230722060706.79759-1-atulpant.linux@gmail.com>
X-Provags-ID: V03:K1:ovsFVaQTyzdjJNYnJ7gfyQVmFsbsHlt9CSz3ZZZVFDJ9zlaqAXY
 1azi5JEKVwy/TdD+T5Ms/N0FljRuiSzzNXdqslqrmuOUar6onShKsc5EsuhgXmcDqLG1/QW
 G7oZWSxxExtHqt5dgU30wRvIuOaIsMEo+vF/p+EI09dezfnsg3sccgYZJLfANkCiXkkbfsB
 N/q/NRyMvHgtC3n8GUEsA==
UI-OutboundReport: notjunk:1;M01:P0:Xs8A5QlEfUg=;lqjpfTPtcA1PJsXeqF7iI+NMg/W
 +dGMCl3C/qs0ssTD2LWvFmrkXgZzmgmb143IVViIQCjoIbvbCC4VaYatVz9KdDqyMzuo7SZYL
 9/jY5OPIaDs4FlMH2Z6isVG08AMkjT/akIVv4jp39nby33bap5uID9OPef1k/uzo98oE2vjeE
 W9e/cibWk4MtqZkqFCUco4h7/uONVpcbCxsi/2+o3h1yOQ4EKNMw6DopznKDohGe6krxw3Kn8
 Swiq8dEHu0T6Dk0jfRI6dSWBKdgGAs+ke7H1WO/XX4eAWb58XNJApaIJWXP3Wkv/Dy/eym3I4
 39ovu0Pj2XrjRGGdGEinv4GNBiDdl4BVep1VVo79KGD/gDIyTPQ0NHgIIjHA7Z+KsE9BQ9cMM
 Bk1n40hZWmf1aJ2iWEqRArFA+S2YSJvzxrDoUdKuPWQmRLhto0Vb953WOT3t4ukb1KZZ2aeQR
 i930LRRUS4TgTT+KQkbE2egEC4oIndXCw9NYUs2tFqHUY3o++Pk6V76hOBtnH7Gzz4fkeKoX7
 tOxy2yeXC/5BkytGQnxSZ3+lmZhp2Mj6DNGp5HhSzi6GUwvRWac0QIbkjstqegz1JRIYr8GsZ
 2vG7U6oLeQFKU3oSKwm/raosaJHKILJbBqkrYwdxvFysFxmQivD97Ez8SuC0M7sjslr/cfEam
 JZsQINy1ElWcaGQx0PTRt/A0XyIS5NQ/qIfPkzq5hxaSAXF04q/XFVAZ1bi6XFPptHtMEO3f4
 ArzqHFGqXx6F0T6iQkGGZYaNcjPRvwdTeNKrsTHKbpH4L9kqY7A2Lt0V172Meago9rbKqmJE5
 ATbb2Qb1PAVcBPmxYlUG4hVKE8L78XAUn/miWPkc1jjDiY9rZkOLoYS0YYJyfbsGnP6Z7tOvn
 PDjmgZBQ1I/j/KY9sDHAq/SM96+49kmQDy2K/CJKE0YFmHu3FuQBidR00+cO+3W2x0VHQHYyO
 Sod3mg==
Cc: LKML <linux-kernel@vger.kernel.org>
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

PiBBZGRzIGEgY2hlY2sgdG8gdmVyaWZ5IGlmIHRoZSBydGMgZGV2aWNlIGZpbGUgaXMgdmFsaWQg
b3Igbm90Cj4gYW5kIHByaW50cyBhIHVzZWZ1bCBlcnJvciBtZXNzYWdlIGlmIHRoZSBmaWxlIGlz
IG5vdCBhY2Nlc3NpYmxlLgoKV2lsbCB0aGUgYXR0ZW50aW9uIGdyb3cgZm9yIHRoZSBhcHBsaWNh
dGlvbiBvZiDigJxpbXBlcmF0aXZlIG1vb2TigJ0KaW4gY2hhbmdlIGRlc2NyaXB0aW9ucz8KClNl
ZSBhbHNvOgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90
b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1w
YXRjaGVzLnJzdD9oPXY2LjUtcmMzI245NAoKCkhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gYWRk
IHRoZSB0YWcg4oCcRml4ZXPigJ0/CgpTZWUgYWxzbzoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRh
dGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3Q/aD12Ni41LXJjMyNuMTQ1CgoKV291
bGQgYW55IG90aGVyIHN1YmplY3QgYmVjb21lIG1vcmUgYXBwcm9wcmlhdGUgZm9yIHlvdXIgcGF0
Y2g/CgpTZWUgYWxzbzoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1p
dHRpbmctcGF0Y2hlcy5yc3Q/aD12Ni41LXJjMyNuNjc5CgpSZWdhcmRzLApNYXJrdXMKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1l
bnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgta2VybmVsLW1lbnRlZXMK
