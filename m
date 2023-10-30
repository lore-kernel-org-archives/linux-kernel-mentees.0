Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C07C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Oct 2023 09:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEE6B43249;
	Mon, 30 Oct 2023 09:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEE6B43249
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=tpW0uOgq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Bsgulnl-ncf; Mon, 30 Oct 2023 09:28:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 571CC437BB;
	Mon, 30 Oct 2023 09:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 571CC437BB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3AD07C0071;
	Mon, 30 Oct 2023 09:28:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5BA50C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 09:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 136E1855D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 09:28:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 136E1855D1
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=tpW0uOgq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z2UZ0X4dEPIf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 09:28:20 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05olkn2082b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::82b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC243855D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 09:28:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC243855D0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ibd6hGvhs2g9tl859UTTjiIigyKdQfPSpHXena2pcKk1yxfOqjTXaS48CuWmZxzdTMPxk79KKNRXeAddqEgItG2IOG1cEQxFh0CLcJFvGuAbiRQ3gsOavPEuCwGzfmUDH0nMmN6LO1wrTrV6Nyx6MFFWB+WQRL6U6gk/Z5/xKr6vxgDd3fo0TV7Ft/T92rt3zY6K7NkAQswk02I5FfgpF7N2wOVBjY3MZ91mZdzlVciw3goiaJcV/Fo/hKlMUaS5gaPl7KZ5NURTDRGCC/IemtHvUpKCY8cFqLkDMLTi7tO1HFDa0CSCmstytODulmQscShj33oQMj5UpcxiKp6Wsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqT/8YncguOhIyosUBuYGPfPwNGl65kK/vqaQ9wFNKo=;
 b=V3ww8ri6VwKt5LfTBjvlROCt5ddCCpfG+Ta85d1yifA6IrO/omRwcfK1ibBiM9Hv/I2ukzWruE0fO3fM4I6+anNXJUazWoUXSSbuurnFSMVPWmrT6wwtcZrQIdzOsNXH4tE5sLfIYixWaBhyrc7kobrHjtYFsA+LwFCP34egbr5KzOt0xLHAMqzqbz2A0LcVG0qIyRkpmqRdnMj0pNkYF/sZFspEBfL9PLxNDZ72OX5rGkbACSRXQTV/xligkOaPaMYvV1Pb/2Xu+VNryEOVzfHZVplCB72L0Z2FU13mi1AY/AW48h64c8o/yHP1anGYai9DhyxMS/xrZhdcaj9/Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZqT/8YncguOhIyosUBuYGPfPwNGl65kK/vqaQ9wFNKo=;
 b=tpW0uOgqMYqWzsJQYVLDqDmKB19F/kn4nu4RrAUcyhYT+FY12T26b+sfHwmLK3mJ2/xRAHjCmq8Vy4K5duCVoksDyWExM3FwpAKJPyFm4aOcl4mb3cJvbvib0i9jWo8SMJtvZO72q+eOrQw2ISIUF6KGdx15c18YTVMwMO4pd36nJ5YOmgKC3xZdatgOwOt1zIeKNbE3zAddav9cExZqL7ghq7vKi9MiMWEbbGQKHlouQ7X8mSyeMSBH/8pEve+yamWFpMSTyKsg1wTNWAbvHOAVKNpnJiQaJ2brrUydO0O8wauIeT7grEg8qTldcJE15qQbg0JR74sJL1lxk/zlQQ==
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:32::19)
 by DU2P193MB2276.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2f3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Mon, 30 Oct
 2023 09:28:16 +0000
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::2db3:2c11:bb43:c6e]) by VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::2db3:2c11:bb43:c6e%5]) with mapi id 15.20.6933.027; Mon, 30 Oct 2023
 09:28:16 +0000
Message-ID: <VI1P193MB075221DDE87BE09A4E7CBB1A99A1A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
Date: Mon, 30 Oct 2023 17:28:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] mm/kasan: Add Allocation, Free, Error timestamps to KASAN
 report
To: Dmitry Vyukov <dvyukov@google.com>
References: <VI1P193MB075256E076A09E5B2EF7A16F99D6A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <CA+fCnZfn0RnnhifNxctrUaLEptE=z9L=e3BY_8tRH2UXZWAO6Q@mail.gmail.com>
 <VI1P193MB07524EFBE97632D575A91EDB99A2A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <CACT4Y+a+xfzXBgqVz3Gxv4Ri1CqHTV1m=i=h4j5KWxsmdP+t5A@mail.gmail.com>
From: Juntong Deng <juntong.deng@outlook.com>
In-Reply-To: <CACT4Y+a+xfzXBgqVz3Gxv4Ri1CqHTV1m=i=h4j5KWxsmdP+t5A@mail.gmail.com>
X-TMN: [KAEsTGjx5ST3o4Xm9YGpFWbUHuXe4GVX]
X-ClientProxiedBy: LO4P265CA0069.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::12) To VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:32::19)
X-Microsoft-Original-Message-ID: <403c50a2-8ae8-4f0f-95c7-d1962016f834@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0752:EE_|DU2P193MB2276:EE_
X-MS-Office365-Filtering-Correlation-Id: 403546a2-f2d7-440a-d2be-08dbd92a8bd3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6jj0O+5M3fyW3HfpNRjX+qne1OtKcUUCcBSKFrpB+cUvq+vMuaVqjDap538Xq/kPu7WURP7+knPrK5z63t9fCJrTznNHRwmpwbU9XJRJnKVz3tICKWedlYx5a1vmlrHleK6HQF2o1prQvht1MiLENJgeC0WHdSbFY/XQVPZ1TMfeEreVHaa6VOiEMyhV1Hvzk1xWomysvmhjZMzwSiz7+aXL0P79sEUeAH8W/NT6fug9c/Ff4vAgGb0FxX8ZG62U6QpNcgcMn8lRVNe2isR4rUwGqjcUz5AtozyataUht7H1KY2kYD/MuG9CTxppE3rRB7JyMjqflz6crs2xxdk1c9J64I/vTRvbispeHsg6VWZP1VEFxV2iaetRRPfhGGw44SZ1nCuahk0DWZhVciSwgj8ELHzrKhacXMczoGlJDEs/WU0KSAvMSCSj5KZl+aFTMgsB0v4JCDEpE2opZ7IIFHZo2dSfoNXjB3PSc7iDi3kG//vc/oPPCt+SiFu3g/Lm8wsAMD82IfLxkmP/w8TVlGMQ7RHVIfd34tWuvWQzngUba3/32f+l6nJ43S3dPoGp5GSA+YD4wQiQxU2v1Nn6JBEwXcmYVZqLXsM9gDMLMa0=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHR2cXlmS3Q1N2xkSHYzWitkc0kxSHVBbnMvQUZYM1FRUHR0TzJIc1VoWkVJ?=
 =?utf-8?B?RVlscFhSZzlGTDJ6d0ltVEd3MmdOZmJ2VWlvVHA5a1czNlRhamdmLy9DcU9J?=
 =?utf-8?B?dkxXcFhKTTNVOVpuNjB4eVRJMUVTbWdnNHdrUWhLSWYxTVBpUmZmMWFBWnZV?=
 =?utf-8?B?QTkrYmNzVkJ2WWFpL1lXaXdQQkdvWVd2OVVUMHRsRnUyS0RUWEFOUWpudDF1?=
 =?utf-8?B?MzArWmNtSUF5N1RTb1hrcGh3Y1FmMnZvbnhLZkhhVUtwaEVudXNITDExZSsw?=
 =?utf-8?B?U2doNW03WGdiUmZ0eG5LNy9lY1F2YVBrSTl1ZDNqSzViYUtuZmVRSitpL0lT?=
 =?utf-8?B?dk1GL1FaSnljU1JNM3JmSGZVOTQwNENuand1VSs4NVNmb0dMT2ZHbXE2cEQ4?=
 =?utf-8?B?elU0bTVDbkhybWJZTFRCVTF6YlVVSnBIaUpBVFBoUDFkQlJjU3QwWnhENkd4?=
 =?utf-8?B?eS85M3VybUcvVkxSejZRNDEwZnZtczQ2dWI0VC9TWnREYUd0N1lQY2lyMFNx?=
 =?utf-8?B?VlU5Vk8wZDk0YXU1OFRsTzFVeE9HQXhhVVhHMHcwNXVVSVZ3OVp3NzdEbzY3?=
 =?utf-8?B?QllLRmhqc3d5SGFJSTJvZjBPYmtWZDlZcUlTOTZMQ3pMMVBmb0Z2ZUlldVFQ?=
 =?utf-8?B?Q3dyb3VreDhOZDgxekpTTHIvdkJ6VlZsdzFqeGdqUUF3WkwvYmFCS2ZNaU96?=
 =?utf-8?B?a2NrZDFqK3pxWEpieUI3d0FOb3hETU0vdGc5ZGxBRGk4UWVrbENWS3FhVlJj?=
 =?utf-8?B?bCszQU9PV3Y5bEdhYzV6TmZ1WXk0S1duOTRDK1lZR29pYS94VDladnBuMnRk?=
 =?utf-8?B?cW9sUWpwZm9XZXQ0TFRzUWp3dmtBNkVibVJJNktiTEVoc2FObURIZkU3N0R2?=
 =?utf-8?B?ak5seFYvOFpQMkY0WnYxM2krQW04K2VsNHplZkI3bjRTamRIbzk2djMyOWlQ?=
 =?utf-8?B?RnRtV0tNTDlJVFF6a2FWMHpDSUthNzFzOFVvcXFEUDArSU1RcGcrOFNuQW5t?=
 =?utf-8?B?WFpmc3JvbU9lSUFBZG9ldWVac01acFd4L0NZbEtucjFpRFFNbTJ3TzgrUkxY?=
 =?utf-8?B?SnV6L0VjYmR0WHA5TEg2akIyeHFSRVpSMXRQVkdLajdid2tlVC94NkczSUJY?=
 =?utf-8?B?YlRPc09GQ0FZcFlYVTRiRGFNUTY5OTQvZnF2MW5xM1Vlcm00QSt0UCtaZ3Rz?=
 =?utf-8?B?Qko4TmFhT3grSk5TZGxwdlZCQ1NjR2NGc3lGQ2JIV3g2OUVRL1FGSUlCRWt0?=
 =?utf-8?B?bXFDNGYxYkNXbHdObW9HYVFUMGFEVDZnbExRaXRsajJadWZWNVNoOS9GRTJn?=
 =?utf-8?B?UXA0VWJsSU5ieHNIT20xTFhlRk15QXlzYmRZY29FR2llM2pEdWlsSHpoOXJo?=
 =?utf-8?B?VWs0dGZ1bU00cDFPUGRyRVh2QUpSK1Vhd0RSU2RMN2NESk4ya2xabjBQaVJT?=
 =?utf-8?B?eFF3WFpKcCtaZ2t1TTNTb09lZ21SekUvSXBoRDVzRUhjWTl3QzNPa2RsUGY1?=
 =?utf-8?B?dEQ2VHZQdDA5MHVUUE8ydHdkcGZxRGVLcnZ0ZTU5bCtQK3hPRCtGc3NURXdG?=
 =?utf-8?B?YWVqamNuVlgzcWRHQ0JXeU1XeXFRVXQwbU9xS2J5c1hmRHM0M250LzFjV2V1?=
 =?utf-8?Q?qy5ddhwhGul89ZE921o2LgRDeB33UQV5tXdLWpUDzins=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 403546a2-f2d7-440a-d2be-08dbd92a8bd3
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 09:28:16.4223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P193MB2276
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, ryabinin.a.a@gmail.com,
 glider@google.com, akpm@linux-foundation.org, vincenzo.frascino@arm.com,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Andrey Konovalov <andreyknvl@gmail.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gMjAyMy8xMC8zMCAxNDoyOSwgRG1pdHJ5IFZ5dWtvdiB3cm90ZToKPiBPbiBTdW4sIDI5IE9j
dCAyMDIzIGF0IDEwOjA1LCBKdW50b25nIERlbmcgPGp1bnRvbmcuZGVuZ0BvdXRsb29rLmNvbT4g
d3JvdGU6Cj4+Cj4+IE9uIDIwMjMvMTAvMjYgMzoyMiwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToK
Pj4+IE9uIFR1ZSwgT2N0IDE3LCAyMDIzIGF0IDk6NDDigK9QTSBKdW50b25nIERlbmcgPGp1bnRv
bmcuZGVuZ0BvdXRsb29rLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+PiBUaGUgaWRlYSBjYW1lIGZyb20g
dGhlIGJ1ZyBJIHdhcyBmaXhpbmcgcmVjZW50bHksCj4+Pj4gJ0tBU0FOOiBzbGFiLXVzZS1hZnRl
ci1mcmVlIFJlYWQgaW4gdGxzX2VuY3J5cHRfZG9uZScuCj4+Pj4KPj4+PiBUaGlzIGJ1ZyBpcyBj
YXVzZWQgYnkgc3VidGxlIHJhY2UgY29uZGl0aW9uLCB3aGVyZSB0aGUgZGF0YSBzdHJ1Y3R1cmUK
Pj4+PiBpcyBmcmVlZCBlYXJseSBvbiBhbm90aGVyIENQVSwgcmVzdWx0aW5nIGluIHVzZS1hZnRl
ci1mcmVlLgo+Pj4+Cj4+Pj4gTGlrZSB0aGlzIGJ1Zywgc29tZSBvZiB0aGUgdXNlLWFmdGVyLWZy
ZWUgYnVncyBhcmUgY2F1c2VkIGJ5IHJhY2UKPj4+PiBjb25kaXRpb24sIGJ1dCBpdCBpcyBub3Qg
ZWFzeSB0byBxdWlja2x5IGNvbmNsdWRlIHRoYXQgdGhlIGNhdXNlIG9mIHRoZQo+Pj4+IHVzZS1h
ZnRlci1mcmVlIGlzIHJhY2UgY29uZGl0aW9uIGlmIG9ubHkgbG9va2luZyBhdCB0aGUgc3RhY2sg
dHJhY2UuCj4+Pj4KPj4+PiBJIGRpZCBub3QgdGhpbmsgdGhpcyB1c2UtYWZ0ZXItZnJlZSB3YXMg
Y2F1c2VkIGJ5IHJhY2UgY29uZGl0aW9uIGF0IHRoZQo+Pj4+IGJlZ2lubmluZywgaXQgdG9vayBt
ZSBzb21lIHRpbWUgdG8gcmVhZCB0aGUgc291cmNlIGNvZGUgY2FyZWZ1bGx5IGFuZAo+Pj4+IHRo
aW5rIGFib3V0IGl0IHRvIGRldGVybWluZSB0aGF0IGl0IHdhcyBjYXVzZWQgYnkgcmFjZSBjb25k
aXRpb24uCj4+Pj4KPj4+PiBCeSBhZGRpbmcgdGltZXN0YW1wcyBmb3IgQWxsb2NhdGlvbiwgRnJl
ZSwgYW5kIEVycm9yIHRvIHRoZSBLQVNBTgo+Pj4+IHJlcG9ydCwgaXQgd2lsbCBiZSBtdWNoIGVh
c2llciB0byBkZXRlcm1pbmUgaWYgdXNlLWFmdGVyLWZyZWUgaXMKPj4+PiBjYXVzZWQgYnkgcmFj
ZSBjb25kaXRpb24uCj4+Pgo+Pj4gQW4gYWx0ZXJuYXRpdmUgd291bGQgYmUgdG8gYWRkIHRoZSBD
UFUgbnVtYmVyIHRvIHRoZSBhbGxvYy9mcmVlIHN0YWNrCj4+PiB0cmFjZXMuIFNvbWV0aGluZyBs
aWtlOgo+Pj4KPj4+IEFsbG9jYXRlZCBieSB0YXNrIDQyIG9uIENQVSAyOgo+Pj4gKHN0YWNrIHRy
YWNlKQo+Pj4KPj4+IFRoZSBiYWQgYWNjZXNzIHN0YWNrIHRyYWNlIGFscmVhZHkgcHJpbnRzIHRo
ZSBDUFUgbnVtYmVyLgo+Pgo+PiBZZXMsIHRoYXQgaXMgYSBncmVhdCBpZGVhIGFuZCB0aGUgQ1BV
IG51bWJlciB3b3VsZCBoZWxwIGEgbG90Lgo+Pgo+PiBCdXQgSSB0aGluayB0aGUgQ1BVIG51bWJl
ciBjYW5ub3QgY29tcGxldGVseSByZXBsYWNlIHRoZSBmcmVlIHRpbWVzdGFtcCwKPj4gYmVjYXVz
ZSBzb21lIGZyZWVpbmcgcmVhbGx5IHNob3VsZCBiZSBkb25lIGF0IGFub3RoZXIgQ1BVLgo+Pgo+
PiBXZSBuZWVkIHRoZSBmcmVlIHRpbWVzdGFtcCB0byBoZWxwIHVzIGRpc3Rpbmd1aXNoIHdoZXRo
ZXIgaXQgd2FzIGZyZWVkCj4+IGEgbG9uZyB0aW1lIGFnbyBvciB3aGV0aGVyIGl0IHdhcyBjYXVz
ZWQgdG8gYmUgZnJlZWQgZHVyaW5nIHRoZQo+PiBjdXJyZW50IG9wZXJhdGlvbi4KPj4KPj4gSSB0
aGluayBib3RoIHRoZSBDUFUgbnVtYmVyIGFuZCB0aGUgdGltZXN0YW1wIHNob3VsZCBiZSBkaXNw
bGF5ZWQsIG1vcmUKPj4gaW5mb3JtYXRpb24gd291bGQgaGVscCB1cyBmaW5kIHRoZSByZWFsIGNh
dXNlIG9mIHRoZSBlcnJvciBmYXN0ZXIuCj4+Cj4+IFNob3VsZCBJIGltcGxlbWVudCB0aGVzZSBm
ZWF0dXJlcz8KPiAKPiBIaSBKdW50b25nLAo+IAo+IFRoZXJlIGlzIGFsc28gYW4gYXNwZWN0IG9m
IG1lbW9yeSBjb25zdW1wdGlvbi4gS0FTQU4gaGVhZGVycyBpbmNyZWFzZQo+IHRoZSBzaXplIG9m
IGV2ZXJ5IGhlYXAgb2JqZWN0LiBTbyB3ZSB0cmllZCB0byBrZWVwIHRoZW0gYXMgY29tcGFjdCBh
cwo+IHBvc3NpYmxlLiBBdCBzb21lIHBvaW50IENQVSBudW1iZXJzIGFuZCB0aW1lc3RhbXBzIChJ
SVJDKSB3ZXJlIGFscmVhZHkKPiBwYXJ0IG9mIHRoZSBoZWFkZXIsIGJ1dCB3ZSByZW1vdmVkIHRo
ZW0gdG8gc2hyaW5rIHRoZSBoZWFkZXIgdG8gMTYKPiBieXRlcy4KPiBQSUQgZ2l2ZXMgYSBnb29k
IGFwcHJveGltYXRpb24gb2YgcG90ZW50aWFsIHJhY2VzLiBJIHVzdWFsbHkgbG9vayBhdAo+IFBJ
RHMgdG8gdW5kZXJzdGFuZCBpZiBpdCdzIGEgInBsYWluIG9sZCBzaW5nbGUtdGhyZWFkZWQKPiB1
c2UtYWZ0ZXItZnJlZSIsIG9yIGZyZWUgYW5kIGFjY2VzcyBoYXBwZW5lZCBpbiBkaWZmZXJlbnQg
dGhyZWFkcy4KPiBSZSB0aW1lc3RhbXBzLCBJIHNlZSB5b3UgcmVmZXJlbmNlZCBhIHN5emJvdCBy
ZXBvcnQuIFdpdGggc3l6a2FsbGVyCj4gbW9zdCB0aW1lc3RhbXBzIHdpbGwgYmUgdmVyeSBjbG9z
ZSBldmVuIGZvciBub24tcmFjaW5nIGNhc2UuCj4gU28gaWYgdGhpcyBpcyBhZGRlZCwgdGhpcyBz
aG91bGQgYmUgYWRkZWQgYXQgbGVhc3QgdW5kZXIgYSBzZXBhcmF0ZSBjb25maWcuCj4gCj4gSWYg
eW91IGFyZSBsb29raW5nIGZvciBwb3RlbnRpYWwgS0FTQU4gaW1wcm92ZW1lbnRzLCBoZXJlIGlz
IGEgZ29vZCBsaXN0Ogo+IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9idWdsaXN0LmNnaT9i
dWdfc3RhdHVzPV9fb3Blbl9fJmNvbXBvbmVudD1TYW5pdGl6ZXJzJmxpc3RfaWQ9MTEzNDE2OCZw
cm9kdWN0PU1lbW9yeSUyME1hbmFnZW1lbnQKCkhpIERtaXRyeSwKCkkgdGhpbmsgUElEIGNhbm5v
dCBjb21wbGV0ZWx5IHJlcGxhY2UgdGltZXN0YW1wIGZvciByZWFzb24gc2ltaWxhciB0bwpDUFUg
bnVtYmVyLCBzb21lIGZyZWVzIHJlYWxseSBzaG91bGQgYmUgZG9uZSBpbiBhbm90aGVyIHRocmVh
ZCwgYnV0IGl0CmlzIGRpZmZpY3VsdCBmb3IgdXMgdG8gZGlzdGluZ3Vpc2ggaWYgaXQgaXMgYSBm
cmVlIHRoYXQgd2FzIGRvbmUgc29tZQp0aW1lIGFnbywgb3IgdW5kZXIgc3VidGxlIHJhY2UgY29u
ZGl0aW9ucy4KCkFzIHRvIHdoZXRoZXIgbW9zdCBvZiB0aGUgdGltZXN0YW1wcyB3aWxsIGJlIHZl
cnkgY2xvc2UgZXZlbiBmb3IKbm9uLXJhY2luZyBjYXNlLCB0aGlzIEkgYW0gbm90IHN1cmUsIGJl
Y2F1c2UgSSBkbyBub3QgaGF2ZQplbm91Z2ggc2FtcGxlcy4KCkkgYWdyZWUgdGhhdCB0aGVzZSBm
ZWF0dXJlcyBzaG91bGQgYmUgaW4gYSBzZXBhcmF0ZSBjb25maWcgYW5kCnRoZSB1c2VyIHNob3Vs
ZCBiZSBmcmVlIHRvIGNob29zZSB3aGV0aGVyIHRvIGVuYWJsZSB0aGVtIG9yIG5vdC4KCldlIGNh
biBkaXZpZGUgS0FTQU4gaW50byBub3JtYWwgbW9kZSBhbmQgZGVwdGggbW9kZS4gTm9ybWFsIG1v
ZGUKcmVjb3JkcyBvbmx5IG1pbmltYWwgY3JpdGljYWwgaW5mb3JtYXRpb24sIHdoaWxlIGRlcHRo
IG1vZGUgcmVjb3Jkcwptb3JlIHBvdGVudGlhbGx5IHVzZWZ1bCBpbmZvcm1hdGlvbi4KCkFsc28s
IGhvbmVzdGx5LCBJIHRoaW5rIGEgc21hbGwgYW1vdW50IG9mIGV4dHJhIG1lbW9yeSBjb25zdW1w
dGlvbgpzaG91bGQgbm90IHN0b3AgdXMgZnJvbSByZWNvcmRpbmcgbW9yZSBpbmZvcm1hdGlvbi4K
CkJlY2F1c2UgaWYgc29tZW9uZSBlbmFibGVzIEtBU0FOIGZvciBkZWJ1Z2dpbmcsIHRoZW4gbWVt
b3J5IGNvbnN1bXB0aW9uCmFuZCBwZXJmb3JtYW5jZSBhcmUgbm8gbG9uZ2VyIGhpcyBtYWluIGNv
bmNlcm4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0
cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
