Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC95AC4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Oct 2023 11:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09E51705C9;
	Mon, 30 Oct 2023 11:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09E51705C9
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=mE8jRvB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ocK6XNdjOU-H; Mon, 30 Oct 2023 11:32:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 69B65610B7;
	Mon, 30 Oct 2023 11:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69B65610B7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E8B2C0071;
	Mon, 30 Oct 2023 11:32:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D026AC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 11:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 967FB43857
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 11:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 967FB43857
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=mE8jRvB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id petL931-DQIb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 11:32:51 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04olkn0825.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::825])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C8C943850
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 11:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C8C943850
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bps1KWIhO6j3xEawxDykhW6Jd9Q9N6IJwllIFdSZWKkMhh5bImXzSFYWZKhBTKF0OZeq5aECQ5VcIJCah3oqhzeBj+oGfrAh0KWxYF/rvrOunUcGDh7+rtp9bfEzBsWDyOZj4+HzbsvOPm15irjMQTExKqjQ6IgtPxwlhFCaY8yDtxVSLtUj02ARKlJVOpWgXuHQDIOOuvT9XUowjUIpqFLDh/7Z8LCV8iOu+wTtYr5JObtnK8BmzwHk2I9H9vLRQUOe4D18fdn7EnK53nzCqfqM6TjiBWbmmDPnHqPophBLa/zzwF71f2v4lxGKgQlhed9opCRYZwkX3NkMwoMD7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0sbShoVaCxZ4fIRI5i+82yMZNf2ZLJdT22vPfLNN+o=;
 b=WWLvtRX1AJupGvWef8XFuDee1tBw3g3lfEhAgGzuPvIdhFSVPNjihTt2pFQLVn/PnBhJzb2qYs4yMEqFU/80j4kTg8RD3qKueSyNOjfcEWjsKiiGMzLHf1+9CJj2b0/Diuka5GSKG95BNRehajhuhfsZYK3bVH12u1teGDhun6572HPhaPeDJjnt53Qc+xYovG5LAG2CXL47hWhzJN8VGJ6hTgpwWEiOenJPyto4ILxqY7GD5TBXiYXSmcoxDIywx5rSSiPyH1xJZ+J66sLKN7DHmzvqTPR8fbj2QhNDmAW5Ao9qcIbaE83mQBOtxSK7r6d3c36aWQdiAzCpyE5UkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0sbShoVaCxZ4fIRI5i+82yMZNf2ZLJdT22vPfLNN+o=;
 b=mE8jRvB8VCuHMzUG2Y1DXb7bEE7LHBQ2WuD3D2zBdH1Ltiwa1OQLe44pAZilVMOS8B3DyRYzyI9WPGmzXamDeqJz3I5CdwSUccZBAEfEY6To3EY37gKTRTU6we+PjxxOWUJf82Hj8DaoT9cuvOddI3NMhAbHwPdS9H4qRCA4/j4itWocHrGXTtIldLB6iRC61FOcfkxiVuvqEFllGnweAbkp+OFCQHjubimIXDJzxh86GMCTq6D+XtgdY7/A8EE4AFGxMOw4DnF6LTi1UEnu8P0xwWYVANpSUIhodHdSUvsUA4/EUlB0ecEwdXsQ6J8Td9u6WbBZIilwlG4EuBwBWA==
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:32::19)
 by PR3P193MB0976.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:a0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Mon, 30 Oct
 2023 11:32:47 +0000
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::2db3:2c11:bb43:c6e]) by VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::2db3:2c11:bb43:c6e%5]) with mapi id 15.20.6933.027; Mon, 30 Oct 2023
 11:32:47 +0000
Message-ID: <VI1P193MB0752753CB059C9A4420C875799A1A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
Date: Mon, 30 Oct 2023 19:32:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] mm/kasan: Add Allocation, Free, Error timestamps to KASAN
 report
To: Dmitry Vyukov <dvyukov@google.com>
References: <VI1P193MB075256E076A09E5B2EF7A16F99D6A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <CA+fCnZfn0RnnhifNxctrUaLEptE=z9L=e3BY_8tRH2UXZWAO6Q@mail.gmail.com>
 <VI1P193MB07524EFBE97632D575A91EDB99A2A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <CACT4Y+a+xfzXBgqVz3Gxv4Ri1CqHTV1m=i=h4j5KWxsmdP+t5A@mail.gmail.com>
 <VI1P193MB075221DDE87BE09A4E7CBB1A99A1A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <CACT4Y+bxMKEVUhu-RDvOMcbah=iYCWdXFZDU0JN3D7OP26Q_Dw@mail.gmail.com>
From: Juntong Deng <juntong.deng@outlook.com>
In-Reply-To: <CACT4Y+bxMKEVUhu-RDvOMcbah=iYCWdXFZDU0JN3D7OP26Q_Dw@mail.gmail.com>
X-TMN: [OqsKE/zsmXY4SJnsYIcDvATGT24dPw4u]
X-ClientProxiedBy: LO4P123CA0556.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::6) To VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:32::19)
X-Microsoft-Original-Message-ID: <50303875-57fc-4012-ace7-38dfca2c3be1@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0752:EE_|PR3P193MB0976:EE_
X-MS-Office365-Filtering-Correlation-Id: 31628e30-aa93-4b27-a5b1-08dbd93bf0c1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uLvzONZU1cAG7w0PNz9V0zus3sIg3ZrbkfjO3+L4n9cVgAebTjVEX1PsZAivn5jK/a7pbDBmzV4TQHvKbg3kNstjA0uqkK8vNM6dnpwH+fUX1Nji34zvy1In39ZDrFzbWmmKWiGhZMMBVfnfOYNm5ib/SWsuHCbykH/AQuZ/KiCtnaCPlzsQavqTxeY5revHKE6Erozjt31TwvUdSP6CpzeS1WlujoHihyr2bn+JBvE44W3c70Pq0WvLL/3Yljc0H0NihA+9IWr2l/+8BJTfmRPThdQlB/JrLkmTXZa0o7csblLXrf1z26Z5s9gO2FGdKqnmoeHV1PgF30ydi6lrmNOJxwzmWPcDeUgmVRBN+uhbpQHjzcbYcTktG7qTevqQd+5k0FyoBIWpyE8+ZQ8fm5Azvub8bf7GEk0V7i2Dvxlm7NAnnG6mTEPWLr99usDh2NV0LhPukc+nu5ULEEvW6SHd+K7BIfoWDRnXSk9Dn/YhGvwCIatgq1nmLsJknBJ5b3IhPgR9QBQPNUBiFLK86z6OrkCW8rtsI/wvpcc+QUyjlax5zIznx0o47c1tkY14oh6vksY8fXuC2LpJT16P3wOqJtV/xL5JJFEP8Y2/OA8=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2lGVk9kSk9kUWxjSE1XVFR6cG5SSlNrbStuMnI3SndHdjBqWVhjVk9KS3JO?=
 =?utf-8?B?S1dBMzRNODI4ekxDVG1vVTg2NFFRZFo3TWd2ajFpMjZnditGa21XckR3SWRm?=
 =?utf-8?B?VnFlNFdyaEc3UVRMb0k2UFZ0RkVVZ2NYb1RINlhaTTIzN0Qwa0t1YUxCbkNX?=
 =?utf-8?B?VVZxS0RrT25ZOHAxSkFTWld3WmJ5SCttOVoxQVJLQ0dpQVZyQlNXd0greGdp?=
 =?utf-8?B?V2VWSzhocTkyT1BFVTkrREJMbGorRG5TMEIzenlDcUpXRlBWL0tKQi85MFBx?=
 =?utf-8?B?UGN0dy9JOWsyUXBYTEpuMk5pdFllMkVERkhBaXlpbklWTG9NWk83ZHo2ZFR5?=
 =?utf-8?B?UTRqdnE1OTNyNGhQTXBFQmlpQUxJeGZES3ZMQjVVRHRRQ0cyUTBrNTdiYnRU?=
 =?utf-8?B?UFR4eDBXdTZXUjBHMGxXaE5qaGxEOURGRERrTGtRejF0aFkxMWs3emRtUzl4?=
 =?utf-8?B?YkN5N1RNUmdSb0ZNQkplTHI2UmxqNkxrY0Q1YUZCZzJjYmRjalNKOHJvZmtW?=
 =?utf-8?B?MjROa2tuYWYwdEVwbEZSWmxyNExXYm9nZmF4Qmswb1c4VVFMazFBREp5Qnlu?=
 =?utf-8?B?SkI3ODAvOUlqVkd4WENEek14aVpEVlFhaWMyVmREMW1PeG4yc2g2Q0U5N1Fu?=
 =?utf-8?B?dFBjRlRHRmdJaTV1WkpyLzJoc3I5dGJPQWdBY1A3ZUsvdGpTYm4yZkZZMFhl?=
 =?utf-8?B?bEZyTk53OTY3d1hZUzNrQzdJQXlmdm9uWnBjU2xWdUxORVV6Z0w1SU8rNFZC?=
 =?utf-8?B?VUxuMVVWT1VCanZzY0JFbnR0S0Z3TkFNdG1LeU9yeGtTdXlUalh4TEhRdkE5?=
 =?utf-8?B?TTBkQmpJblVUTGM3ZTRDMnRXbWdOYzQ4LzFVVGkrSk8yU0JPU0Q2dE1TY3JI?=
 =?utf-8?B?ejRZR3ZBTWhrU1pIcUxGcmRvTXFhRS9DK3VEQkN5VDdJZk9JR2N5Qk5WTEhL?=
 =?utf-8?B?MVRMellhc3o0VDFIS1EyeVFkVjNIbWdpaEJzeUhBaDl3bGo3RDVXbStSa3RV?=
 =?utf-8?B?RHRTTm9YKzU0eGUxM1VLYVhYMnlMWDZhSVFOMWxEL0lMZ2dmVWg4cWxNMzlQ?=
 =?utf-8?B?NGF0MlhBVEVQZmtyemp3K0ZicUg5UWp2WXFYWHNzQlFuK0c0NmFzUDVWK0JT?=
 =?utf-8?B?Um9BSHJtQWZ1SEtYZGlNYldnMWxQdmdxK05IVDJKckZhQzVlVFFXZENKd0xY?=
 =?utf-8?B?TXk0QlNMckhqVDNFOUttS0VWYndwN3VvRXFYbnR5ZTJwU1FuaUFaWlRpV3o3?=
 =?utf-8?B?ektsNDhLSWw4a1NBdHlXSkZmTGd4T0hXRHY4YWJLbER5L1hIczRUcUExbVNr?=
 =?utf-8?B?UzZvZGtpeU1iMWdxTFZSSWJLeWY3UmRIczF2OGxOYURVc1lNQUxBQzZ3S1hL?=
 =?utf-8?B?Q0oybFJMSndrYld6SVdVblo2VTBta2Y1U3B3aHdxdEI0a1lsWG4zdlU0Myt6?=
 =?utf-8?B?NGh5bTMvMjNvQUJSajl4bEtvK1BjQ09JV1RGdVZWODRxMjQxWGNjRzNJaSsr?=
 =?utf-8?B?MWJhU2lxdndCRzg3eTgyc1pGbU54bW9QMG5rU0NPVHFEV3lpb0lwUG9RbHJ2?=
 =?utf-8?B?UWh5T3p6ZVRRWHg4Q1poMWFSTmZUK2x5SVdFNEtCVysvb3c5bGc4amljOUZK?=
 =?utf-8?Q?R/ujq4WvnGQtE6GJaS4ZOSr7CC22kEWVvT6gKixGMKfI=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31628e30-aa93-4b27-a5b1-08dbd93bf0c1
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 11:32:47.1352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P193MB0976
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

T24gMjAyMy8xMC8zMCAxODoxMCwgRG1pdHJ5IFZ5dWtvdiB3cm90ZToKPiBPbiBNb24sIDMwIE9j
dCAyMDIzIGF0IDEwOjI4LCBKdW50b25nIERlbmcgPGp1bnRvbmcuZGVuZ0BvdXRsb29rLmNvbT4g
d3JvdGU6Cj4+Cj4+IE9uIDIwMjMvMTAvMzAgMTQ6MjksIERtaXRyeSBWeXVrb3Ygd3JvdGU6Cj4+
PiBPbiBTdW4sIDI5IE9jdCAyMDIzIGF0IDEwOjA1LCBKdW50b25nIERlbmcgPGp1bnRvbmcuZGVu
Z0BvdXRsb29rLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+PiBPbiAyMDIzLzEwLzI2IDM6MjIsIEFuZHJl
eSBLb25vdmFsb3Ygd3JvdGU6Cj4+Pj4+IE9uIFR1ZSwgT2N0IDE3LCAyMDIzIGF0IDk6NDDigK9Q
TSBKdW50b25nIERlbmcgPGp1bnRvbmcuZGVuZ0BvdXRsb29rLmNvbT4gd3JvdGU6Cj4+Pj4+Pgo+
Pj4+Pj4gVGhlIGlkZWEgY2FtZSBmcm9tIHRoZSBidWcgSSB3YXMgZml4aW5nIHJlY2VudGx5LAo+
Pj4+Pj4gJ0tBU0FOOiBzbGFiLXVzZS1hZnRlci1mcmVlIFJlYWQgaW4gdGxzX2VuY3J5cHRfZG9u
ZScuCj4+Pj4+Pgo+Pj4+Pj4gVGhpcyBidWcgaXMgY2F1c2VkIGJ5IHN1YnRsZSByYWNlIGNvbmRp
dGlvbiwgd2hlcmUgdGhlIGRhdGEgc3RydWN0dXJlCj4+Pj4+PiBpcyBmcmVlZCBlYXJseSBvbiBh
bm90aGVyIENQVSwgcmVzdWx0aW5nIGluIHVzZS1hZnRlci1mcmVlLgo+Pj4+Pj4KPj4+Pj4+IExp
a2UgdGhpcyBidWcsIHNvbWUgb2YgdGhlIHVzZS1hZnRlci1mcmVlIGJ1Z3MgYXJlIGNhdXNlZCBi
eSByYWNlCj4+Pj4+PiBjb25kaXRpb24sIGJ1dCBpdCBpcyBub3QgZWFzeSB0byBxdWlja2x5IGNv
bmNsdWRlIHRoYXQgdGhlIGNhdXNlIG9mIHRoZQo+Pj4+Pj4gdXNlLWFmdGVyLWZyZWUgaXMgcmFj
ZSBjb25kaXRpb24gaWYgb25seSBsb29raW5nIGF0IHRoZSBzdGFjayB0cmFjZS4KPj4+Pj4+Cj4+
Pj4+PiBJIGRpZCBub3QgdGhpbmsgdGhpcyB1c2UtYWZ0ZXItZnJlZSB3YXMgY2F1c2VkIGJ5IHJh
Y2UgY29uZGl0aW9uIGF0IHRoZQo+Pj4+Pj4gYmVnaW5uaW5nLCBpdCB0b29rIG1lIHNvbWUgdGlt
ZSB0byByZWFkIHRoZSBzb3VyY2UgY29kZSBjYXJlZnVsbHkgYW5kCj4+Pj4+PiB0aGluayBhYm91
dCBpdCB0byBkZXRlcm1pbmUgdGhhdCBpdCB3YXMgY2F1c2VkIGJ5IHJhY2UgY29uZGl0aW9uLgo+
Pj4+Pj4KPj4+Pj4+IEJ5IGFkZGluZyB0aW1lc3RhbXBzIGZvciBBbGxvY2F0aW9uLCBGcmVlLCBh
bmQgRXJyb3IgdG8gdGhlIEtBU0FOCj4+Pj4+PiByZXBvcnQsIGl0IHdpbGwgYmUgbXVjaCBlYXNp
ZXIgdG8gZGV0ZXJtaW5lIGlmIHVzZS1hZnRlci1mcmVlIGlzCj4+Pj4+PiBjYXVzZWQgYnkgcmFj
ZSBjb25kaXRpb24uCj4+Pj4+Cj4+Pj4+IEFuIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRvIGFkZCB0
aGUgQ1BVIG51bWJlciB0byB0aGUgYWxsb2MvZnJlZSBzdGFjawo+Pj4+PiB0cmFjZXMuIFNvbWV0
aGluZyBsaWtlOgo+Pj4+Pgo+Pj4+PiBBbGxvY2F0ZWQgYnkgdGFzayA0MiBvbiBDUFUgMjoKPj4+
Pj4gKHN0YWNrIHRyYWNlKQo+Pj4+Pgo+Pj4+PiBUaGUgYmFkIGFjY2VzcyBzdGFjayB0cmFjZSBh
bHJlYWR5IHByaW50cyB0aGUgQ1BVIG51bWJlci4KPj4+Pgo+Pj4+IFllcywgdGhhdCBpcyBhIGdy
ZWF0IGlkZWEgYW5kIHRoZSBDUFUgbnVtYmVyIHdvdWxkIGhlbHAgYSBsb3QuCj4+Pj4KPj4+PiBC
dXQgSSB0aGluayB0aGUgQ1BVIG51bWJlciBjYW5ub3QgY29tcGxldGVseSByZXBsYWNlIHRoZSBm
cmVlIHRpbWVzdGFtcCwKPj4+PiBiZWNhdXNlIHNvbWUgZnJlZWluZyByZWFsbHkgc2hvdWxkIGJl
IGRvbmUgYXQgYW5vdGhlciBDUFUuCj4+Pj4KPj4+PiBXZSBuZWVkIHRoZSBmcmVlIHRpbWVzdGFt
cCB0byBoZWxwIHVzIGRpc3Rpbmd1aXNoIHdoZXRoZXIgaXQgd2FzIGZyZWVkCj4+Pj4gYSBsb25n
IHRpbWUgYWdvIG9yIHdoZXRoZXIgaXQgd2FzIGNhdXNlZCB0byBiZSBmcmVlZCBkdXJpbmcgdGhl
Cj4+Pj4gY3VycmVudCBvcGVyYXRpb24uCj4+Pj4KPj4+PiBJIHRoaW5rIGJvdGggdGhlIENQVSBu
dW1iZXIgYW5kIHRoZSB0aW1lc3RhbXAgc2hvdWxkIGJlIGRpc3BsYXllZCwgbW9yZQo+Pj4+IGlu
Zm9ybWF0aW9uIHdvdWxkIGhlbHAgdXMgZmluZCB0aGUgcmVhbCBjYXVzZSBvZiB0aGUgZXJyb3Ig
ZmFzdGVyLgo+Pj4+Cj4+Pj4gU2hvdWxkIEkgaW1wbGVtZW50IHRoZXNlIGZlYXR1cmVzPwo+Pj4K
Pj4+IEhpIEp1bnRvbmcsCj4+Pgo+Pj4gVGhlcmUgaXMgYWxzbyBhbiBhc3BlY3Qgb2YgbWVtb3J5
IGNvbnN1bXB0aW9uLiBLQVNBTiBoZWFkZXJzIGluY3JlYXNlCj4+PiB0aGUgc2l6ZSBvZiBldmVy
eSBoZWFwIG9iamVjdC4gU28gd2UgdHJpZWQgdG8ga2VlcCB0aGVtIGFzIGNvbXBhY3QgYXMKPj4+
IHBvc3NpYmxlLiBBdCBzb21lIHBvaW50IENQVSBudW1iZXJzIGFuZCB0aW1lc3RhbXBzIChJSVJD
KSB3ZXJlIGFscmVhZHkKPj4+IHBhcnQgb2YgdGhlIGhlYWRlciwgYnV0IHdlIHJlbW92ZWQgdGhl
bSB0byBzaHJpbmsgdGhlIGhlYWRlciB0byAxNgo+Pj4gYnl0ZXMuCj4+PiBQSUQgZ2l2ZXMgYSBn
b29kIGFwcHJveGltYXRpb24gb2YgcG90ZW50aWFsIHJhY2VzLiBJIHVzdWFsbHkgbG9vayBhdAo+
Pj4gUElEcyB0byB1bmRlcnN0YW5kIGlmIGl0J3MgYSAicGxhaW4gb2xkIHNpbmdsZS10aHJlYWRl
ZAo+Pj4gdXNlLWFmdGVyLWZyZWUiLCBvciBmcmVlIGFuZCBhY2Nlc3MgaGFwcGVuZWQgaW4gZGlm
ZmVyZW50IHRocmVhZHMuCj4+PiBSZSB0aW1lc3RhbXBzLCBJIHNlZSB5b3UgcmVmZXJlbmNlZCBh
IHN5emJvdCByZXBvcnQuIFdpdGggc3l6a2FsbGVyCj4+PiBtb3N0IHRpbWVzdGFtcHMgd2lsbCBi
ZSB2ZXJ5IGNsb3NlIGV2ZW4gZm9yIG5vbi1yYWNpbmcgY2FzZS4KPj4+IFNvIGlmIHRoaXMgaXMg
YWRkZWQsIHRoaXMgc2hvdWxkIGJlIGFkZGVkIGF0IGxlYXN0IHVuZGVyIGEgc2VwYXJhdGUgY29u
ZmlnLgo+Pj4KPj4+IElmIHlvdSBhcmUgbG9va2luZyBmb3IgcG90ZW50aWFsIEtBU0FOIGltcHJv
dmVtZW50cywgaGVyZSBpcyBhIGdvb2QgbGlzdDoKPj4+IGh0dHBzOi8vYnVnemlsbGEua2VybmVs
Lm9yZy9idWdsaXN0LmNnaT9idWdfc3RhdHVzPV9fb3Blbl9fJmNvbXBvbmVudD1TYW5pdGl6ZXJz
Jmxpc3RfaWQ9MTEzNDE2OCZwcm9kdWN0PU1lbW9yeSUyME1hbmFnZW1lbnQKPj4KPj4gSGkgRG1p
dHJ5LAo+Pgo+PiBJIHRoaW5rIFBJRCBjYW5ub3QgY29tcGxldGVseSByZXBsYWNlIHRpbWVzdGFt
cCBmb3IgcmVhc29uIHNpbWlsYXIgdG8KPj4gQ1BVIG51bWJlciwgc29tZSBmcmVlcyByZWFsbHkg
c2hvdWxkIGJlIGRvbmUgaW4gYW5vdGhlciB0aHJlYWQsIGJ1dCBpdAo+PiBpcyBkaWZmaWN1bHQg
Zm9yIHVzIHRvIGRpc3Rpbmd1aXNoIGlmIGl0IGlzIGEgZnJlZSB0aGF0IHdhcyBkb25lIHNvbWUK
Pj4gdGltZSBhZ28sIG9yIHVuZGVyIHN1YnRsZSByYWNlIGNvbmRpdGlvbnMuCj4gCj4gSSBhZ3Jl
ZSBpdCdzIG5vdCBhIGNvbXBsZXRlIHJlcGxhY2VtZW50LCBpdCBqdXN0IGRvZXMgbm90IGNvbnN1
bWUKPiBhZGRpdGlvbmFsIG1lbW9yeS4KPiAKPj4gQXMgdG8gd2hldGhlciBtb3N0IG9mIHRoZSB0
aW1lc3RhbXBzIHdpbGwgYmUgdmVyeSBjbG9zZSBldmVuIGZvcgo+PiBub24tcmFjaW5nIGNhc2Us
IHRoaXMgSSBhbSBub3Qgc3VyZSwgYmVjYXVzZSBJIGRvIG5vdCBoYXZlCj4+IGVub3VnaCBzYW1w
bGVzLgo+Pgo+PiBJIGFncmVlIHRoYXQgdGhlc2UgZmVhdHVyZXMgc2hvdWxkIGJlIGluIGEgc2Vw
YXJhdGUgY29uZmlnIGFuZAo+PiB0aGUgdXNlciBzaG91bGQgYmUgZnJlZSB0byBjaG9vc2Ugd2hl
dGhlciB0byBlbmFibGUgdGhlbSBvciBub3QuCj4+Cj4+IFdlIGNhbiBkaXZpZGUgS0FTQU4gaW50
byBub3JtYWwgbW9kZSBhbmQgZGVwdGggbW9kZS4gTm9ybWFsIG1vZGUKPj4gcmVjb3JkcyBvbmx5
IG1pbmltYWwgY3JpdGljYWwgaW5mb3JtYXRpb24sIHdoaWxlIGRlcHRoIG1vZGUgcmVjb3Jkcwo+
PiBtb3JlIHBvdGVudGlhbGx5IHVzZWZ1bCBpbmZvcm1hdGlvbi4KPj4KPj4gQWxzbywgaG9uZXN0
bHksIEkgdGhpbmsgYSBzbWFsbCBhbW91bnQgb2YgZXh0cmEgbWVtb3J5IGNvbnN1bXB0aW9uCj4+
IHNob3VsZCBub3Qgc3RvcCB1cyBmcm9tIHJlY29yZGluZyBtb3JlIGluZm9ybWF0aW9uLgo+Pgo+
PiBCZWNhdXNlIGlmIHNvbWVvbmUgZW5hYmxlcyBLQVNBTiBmb3IgZGVidWdnaW5nLCB0aGVuIG1l
bW9yeSBjb25zdW1wdGlvbgo+PiBhbmQgcGVyZm9ybWFuY2UgYXJlIG5vIGxvbmdlciBoaXMgbWFp
biBjb25jZXJuLgo+IAo+IFRoZXJlIGFyZSBhIG51bWJlciBvZiBkZWJ1Z2dpbmcgdG9vbHMgY3Jl
YXRlZCB3aXRoIHRoZSAicGVyZm9ybWFuY2UKPiBkb2VzIG5vdCBtYXR0ZXIiIGF0dGl0dWRlLiBU
aGV5IHRlbmQgdG8gYmUgYmFyZWx5IHVzYWJsZSwgbm90IHVzYWJsZQo+IGluIHdpZGUgc2NhbGUg
dGVzdGluZywgbm90IHVzYWJsZSBpbiBjYW5hcmllcywgZXRjLgo+IEFsbCBvZiBzYW5pdGl6ZXJz
IHdlcmUgY3JlYXRlZCB3aXRoIGxvdHMgb2YgYXR0ZW50aW9uIHRvIHBlcmZvcm1hbmNlLAo+IGF0
dGVudGlvbiBvbiB0aGUgbGV2ZWwgb2YgdGhlIG1vc3QgcGVyZm9ybWFuY2UgY3JpdGljYWwgcHJv
ZHVjdGlvbgo+IGNvZGUgKHNhbml0aXplciBjb2RlIGlzIGhvdHRlciB0aGFuIGFueSBwcm9kdWN0
aW9uIHBpZWNlIG9mIGNvZGUpLgo+IFRoYXQncyB3aGF0IG1hZGUgdGhlbSBzbyB3aWRlbHkgdXNl
ZC4gVGhpbmsgb2YgaW50ZXJhY3RpdmUgdXNlcywKPiBzbWFsbGVyIGRldmljZXMsIGV0Yy4gUGxl
YXNlIGxldCdzIGtlZXAgdGhpcyBhdHRpdHVkZS4KClllcywgSSBhZ3JlZSB0aGF0IGRlYnVnZ2lu
ZyB0b29scyB1c2VkIGF0IGEgd2lkZSBzY2FsZSBuZWVkIHRvIGhhdmUKbW9yZSByaWdvcm91cyBw
ZXJmb3JtYW5jZSBjb25zaWRlcmF0aW9ucy4KCkRvIHlvdSB0aGluayBpdCBpcyB3b3J0aCB1c2lu
ZyB0aGUgZXh0cmEgYnl0ZXMgdG8gcmVjb3JkIG1vcmUKaW5mb3JtYXRpb24/IElmIHRoaXMgaXMg
YSB1c2VyLWNvbmZpZ3VyYWJsZSBmZWF0dXJlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGlu
dXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVl
cwo=
