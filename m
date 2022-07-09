Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB706C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  9 Jul 2022 03:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D56A614B3;
	Sat,  9 Jul 2022 03:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D56A614B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aUC-RCswIUED; Sat,  9 Jul 2022 03:14:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3AA116142A;
	Sat,  9 Jul 2022 03:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AA116142A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BE6AC0035;
	Sat,  9 Jul 2022 03:14:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C91FDC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Jul 2022 03:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C5B26149D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Jul 2022 03:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C5B26149D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gWf5_NOR2uJB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Jul 2022 03:14:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA4A06142A
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA4A06142A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Jul 2022 03:14:43 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LfwGM6bg6zFq0P;
 Sat,  9 Jul 2022 11:13:47 +0800 (CST)
Received: from kwepemm600015.china.huawei.com (7.193.23.52) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 9 Jul 2022 11:14:38 +0800
Received: from [10.174.176.52] (10.174.176.52) by
 kwepemm600015.china.huawei.com (7.193.23.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 9 Jul 2022 11:14:37 +0800
Message-ID: <b7ae1cf8-2809-f618-5340-fb8def9a8be0@huawei.com>
Date: Sat, 9 Jul 2022 11:14:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2] ntfs: fix use-after-free in ntfs_ucsncmp()
To: Hawkins Jiawei <yin31149@gmail.com>
References: <20220707105329.4020708-1-chenxiaosong2@huawei.com>
 <20220709005450.2220-1-yin31149@gmail.com>
In-Reply-To: <20220709005450.2220-1-yin31149@gmail.com>
X-Originating-IP: [10.174.176.52]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600015.china.huawei.com (7.193.23.52)
X-CFilter-Loop: Reflected
Cc: yi.zhang@huawei.com, linux-ntfs-dev@lists.sourceforge.net,
 paskripkin@gmail.com, liuyongqiang13@huawei.com, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, zhangxiaoxu5@huawei.com, anton@tuxera.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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
From: "chenxiaosong \(A\) via Linux-kernel-mentees"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: "chenxiaosong \(A\)" <chenxiaosong2@huawei.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

5ZyoIDIwMjIvNy85IDg6NTQsIEhhd2tpbnMgSmlhd2VpIOWGmemBkzo+IEluIG15IG9waW5pb24s
IG5hbWVfbGVuZ3RoIGZpZWxkIApqdXN0IG1lYW5zIHRoZSBudW1iZXIgb2YgY2hhcmFjdGVycywK
PiB5ZXQgZWFjaCBjaGFyYWN0ZXIgaXMgYSBudGZzY2hhciB0eXBlLiBTbyBuYW1lIHNob3VsZCBi
ZQo+IG5hbWVfbGVuZ3RoICogc2l6ZW9mKG50ZnNjaGFyKSBieXRlcy4gVGhlIGV4YW1wbGUgaXMg
YXQKPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xOS1yYzUvc291cmNlL2Zz
L250ZnMvYXR0cmliLmMjTDE2NjcKClllcywgdGhhbmsgeW91IGZvciB5b3VyIHJlcGx5LCBJIHdp
bGwgc2VuZCB2MyBwYXRjaC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1t
ZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
