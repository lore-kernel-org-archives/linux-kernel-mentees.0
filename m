Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC6BCDB474
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Oct 2023 20:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E26540470;
	Tue, 17 Oct 2023 20:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E26540470
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=Kk2C6qDh
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id terKrKJGpm34; Tue, 17 Oct 2023 20:19:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D02C3400D1;
	Tue, 17 Oct 2023 20:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D02C3400D1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7B4DC0071;
	Tue, 17 Oct 2023 20:19:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 578ADC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 20:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AF246102E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 20:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AF246102E
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=Kk2C6qDh
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6TEUEdhLJHsP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 20:19:26 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05olkn2082a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::82a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 623356102D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 20:19:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 623356102D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HchAAx481mdhwic1lrvObpqnDUWNR2wcCunlkbBxhCaP4A3cEFGzwHPZ5houPf7o/HGAKf3LTSojtByveJln0ObzXMnMhh49CfRiwbbI5sabAgg4o275DOmqZMUBjdb4SarMKnmV+3C/BEr7msnoC+5DpqwVRp1fFNQ2EeflqvBRY87xLHdZ9fVf86uFqvbh9G7St2UGab/F1USG6pHu+w5YTuO7gBYwm32hF6v19VaKrBOrYtG34ELSubHbEp3x3SVqd//H3Ty1B6teJrsD6zkwkzhAg8wDmvlpHHrMCjheoERvW7xDiP7GsEnKYLcimuw6naVp1atuv54lU5JOHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDw4QNRhrpdcz12iAryqrnEdVrjJ07EfuZ/2BL8T3/U=;
 b=ih/fFLFM+nX35G5EzVDhB50diQu+A+3LOC9HgByfqZ+eXOIbC6ihrVrIls6xXPwWYaIQfXOi5DZt37gIBaLiawPmE4KgQzqY7SgZtQ5sQOHsKJRWhsUtnC8NywsCu89xY0U+k3MLzOm1luuVcgR5cXgFBRifc8RX2kVw35g3Q5K7xm6lcK4SfUQHghpeQyUF4W8ul72hrAkTEzMFMVhy2aUT3qUzRa9sRM6+MmvwZvaEcWbbKeTtnwb7wVuE8YlL0GIDlk8P2xsDPoxgr7rW6Nvpe7ImfRZp5FZDsiTFtD/fiXT7KK1MCTBVBzcu015L+gBHURDtfSl9cC2SbUMeOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDw4QNRhrpdcz12iAryqrnEdVrjJ07EfuZ/2BL8T3/U=;
 b=Kk2C6qDhGw+jvIjBAR/R235zUfJXqvEdVstiGE7eVpRM0Py/Cl9w4rSqKKdDv74cGpZz6U+rK5o9wimtyAiz+YvZwbYabcjTM5FsIy0fKo70yywEJOJdhL81RNbOnVeyIkdwtvBzDgCVpMxwiPPqXK1/6kZ7dDoSdrESg1V0KwdwXGuIP0Zbrgz3SuqJM0VIifam6OtVrnjqq+uQZjPCbOtjg+pVvZUVRQzDMneLrCLaM+cQL4v53lz1gBeufZTDdVGdo3ftXHosLgqt/oU8vpQd0pDih81sGQKCj+lviS5YzswkKfzXWqfNm1rXXGg5FJes34k99lw3Vvad3vNhGg==
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:32::19)
 by DB8P193MB0600.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:15f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 20:19:21 +0000
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::af68:c2a:73ce:8e99]) by VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::af68:c2a:73ce:8e99%3]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 20:19:21 +0000
Message-ID: <VI1P193MB0752C500BCA9E3193366E7D699D6A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
Date: Wed, 18 Oct 2023 04:19:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] mm/kasan: Add Allocation, Free, Error timestamps to KASAN
 report
To: "Ricardo B. Marliere" <ricardo@marliere.net>
References: <VI1P193MB075256E076A09E5B2EF7A16F99D6A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <eqinp4exznpgclzgz3ytjfdbpjffyyfn62dqfiaw2htk4ppa5p@ip25t7yczqc3>
From: Juntong Deng <juntong.deng@outlook.com>
In-Reply-To: <eqinp4exznpgclzgz3ytjfdbpjffyyfn62dqfiaw2htk4ppa5p@ip25t7yczqc3>
X-TMN: [YAWcUX6F5uacVXMXsIpXKn1iaTT7wF4S]
X-ClientProxiedBy: LO4P265CA0281.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::13) To VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:32::19)
X-Microsoft-Original-Message-ID: <cfcf488a-3267-45bb-8cdf-bddd3320b7b9@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0752:EE_|DB8P193MB0600:EE_
X-MS-Office365-Filtering-Correlation-Id: 70758ed8-4d02-4a36-fa0c-08dbcf4e5956
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ActTe+xHh6WkP3aW/tJQpEyG7+RSvBO1Co1mWEtQZiuEYx9J1c8Ia/7/uikbJnleKkJiidUt+kdwAr7WOduV1tz6yW1cdh7CbeYIl+XoLkmANpw3dsTkSX7775RXVoHhWp4qPXqFsZhFNC/kwNBuQJsS4HUKyeajSoWkhc627PU8sFsFX4CT6Z8UbbZviyk836T/SeEj0rCItxGfpouJu/hZqzMWclH8twyWjR4PiQ8a83zkaantFVlw60/QM5NfdGpx4Q84hZM8kek8nwJK+P34zY09BJFjLCiI3k3QOgWpmMPOGfr2fArH8DPRTLcopkNBKf8YbkqxCH7I+eDjLjHxyBgaNrz2rjMWBUKmsBXCUyb8/8A8U4W8kbWZVwlgBknPvEpKy9xObKlMCNRdDqyW0qElStiQkwRCm6S4n/8+3HGJ+rG0AfDAxNgEFZTXZTxb4hncYTO7FvXh+P6gS/JDcfxbjaMyR61mVUQFcEFDTqPxrkUEuL74sii+NPGaQ9GjD1QOt3h8g4z352qT0M2MBErCPfooy9W7qCnAKE+aSHr5f8WUwR/pBGxNU7JV
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmxhcnprWk9GeWhNem9idWkwbmVMVkxhSmExczNHSnZPUUNQc1BobllpcUZp?=
 =?utf-8?B?RXRORVVraDNOK1U5aWdlVXlYZ2k5ejdpb1JGSGFyMWFFSWFtWllFb0hEaHNk?=
 =?utf-8?B?TjNmV0FYRGlhMmFEWTRETGZRMVhpSFk3cUZRRkJWL0Q4SGI3TGhlSkMzRzdD?=
 =?utf-8?B?MFZxY2RkcC9kYU5TQ1ZLV0tLUjlsVG5WZ1dzSXg4TytkUm51WGxIZlY2bFM3?=
 =?utf-8?B?VEJ5bGQxZ2h0YUREeFlXZStHd3FHMlNWK2NSZWVYTzlsUit4M3RlekQ4ZENk?=
 =?utf-8?B?cVdaaE11YXpqOUhFMzBHbjRXdU5CWWYrSHViK3RnQW1OU1UwdVVMQUQvK0hy?=
 =?utf-8?B?UUd2SDF4UzVHTGg2STZKQUY2dzc1TlNjZnkycWtCc0ZPbzhWQmh6b0s0Nkpj?=
 =?utf-8?B?NDhpeVhNWmNiaGNKLzdGazlUZUxnVzB6S05kVWM5eXVDUDhwSHVpNFozclRk?=
 =?utf-8?B?aVVFUGozVGRoNW8rRENYUDF3RThxNzR0d0NHUmxZQ253NTllS1pvRjJNRnlV?=
 =?utf-8?B?LzU1dSs0cjVMOWd2SElxOUlUQXdwQkdobG9ZMEs0dHcySU1UVFlnTE9rR215?=
 =?utf-8?B?YTN3VUhsTTd5RHc1dytidlIzek5iekovdUk0Z2g1MDF0RDBPQjBsSXNZZWxk?=
 =?utf-8?B?MWhkUW54cy9yMXBPN2Y2ZGxiMW5YWE82SjZWK0dLT2dXNFZUeS93RXJVWGlW?=
 =?utf-8?B?VzV0RXB1UGhTV2w0NGNEYm05WDV5YmNJblJUR0lXL2xwNUZFYnFwbU9aSXBU?=
 =?utf-8?B?aXRlM0pWS1lZc3RMUEh4cTZuZ2pkdklnempQeGR4MS8wbk1zbWRoa25rRFE4?=
 =?utf-8?B?RzZqZzZjOFVRNlJRbXlPcllaOEVWV2ZrdFlGanpBSDIrSFk4d2dibzR6K3Vx?=
 =?utf-8?B?a2pvUWVWWkZMTGtUbU9CR0JFOUlTRXFNTkx0RkdyWE9iNW5LeXViTlhnNEV4?=
 =?utf-8?B?Tm5aRWVVMlVtZjBYQ0xjRnF1RzBwdGJjUUNzTy9UbFY4dGs4dERIVXJyZWZ6?=
 =?utf-8?B?WllGWmtKQ3hMVFF4OHZyWFRvU3ViT2FEUEhyM3Q3RmFZYlk4RTUzNnp5S2dw?=
 =?utf-8?B?NExwREQ3U1lya2t6bElLYzJuL0s0YkRBc2hNb2hzMFVpVFRuMGJ0aFRDLzly?=
 =?utf-8?B?ZWNVSWhYV3RrdmduRG1nRStNKzVvcVZybkxGeEF2MFE1b2tyY3lDSnZtQWpo?=
 =?utf-8?B?eWY1dE5QdW1uKzdEZE9zRGVoSXNBRlEybExTdmZtQ1ZUbUxDN3gwMHVCOVRX?=
 =?utf-8?B?WitzcmFlbGtOdmh3MllTT1VIdVZlRlJSOTIrRFNuUFY5Um5kOTlUakNPeVgv?=
 =?utf-8?B?bmRQSjRCMG5Cc01Pa3RONUZiSnRaS0ZZMHo2ZE1IQXZDUkF3eDZVTkp4Y2Nw?=
 =?utf-8?B?aXJ6eW9rRmlya3g2Qll4OXRoRWordExDaHVvUEV3M3RjOFBYc1VWb3dIdVBo?=
 =?utf-8?B?UkdGaUd3a0VYYXdVaU1uV3A2dlIzdi9Ea3NNOWJNeHZyOEZicks3RG83MUha?=
 =?utf-8?B?NnFxOXF1SFZBTS9BQXFRYVpqT3dzUDQrbHZBckJqaktNVHN2bmR5Rm1jbytP?=
 =?utf-8?B?Y3U2V2dOV2g3c0tlRjFINDJkNjNwWjJlVVFmbk81ZVFaelJhZ2RFSkxrSXpW?=
 =?utf-8?Q?1iYt2nsbadS6MAN377Z7b8BYOH3cj5n92154z2/vCovw=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70758ed8-4d02-4a36-fa0c-08dbcf4e5956
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 20:19:21.8791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P193MB0600
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, ryabinin.a.a@gmail.com,
 glider@google.com, akpm@linux-foundation.org, vincenzo.frascino@arm.com,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>, dvyukov@google.com,
 andreyknvl@gmail.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 2023/10/18 4:10, Ricardo B. Marliere wrote:
> On 23/10/18 03:39AM, Juntong Deng wrote:
>> If the free time is slightly before the error time, then there is a
>> high probability that this is an error caused by race condition.
>>
>> If the free time is long before the error time, then this is obviously
>> not caused by race condition, but by something else.
> 
> That sounds a bit arbitrary to me. How do you set the threshold for each
> case? I mean, the fact remains: an invalid read after the object being
> freed. Does it matter what it was caused by? It should be fixed
> regardless.

There is no threshold, and the timestamps are there to make it easier
for us to guess the cause of the error.

More information (timestamps) can help us find the real cause of the
error faster.

We can only fix the error if we find the real cause of the error.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
