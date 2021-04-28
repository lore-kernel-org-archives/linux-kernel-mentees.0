Return-Path: <SRS0=jYeA=JZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CFFC433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Apr 2021 12:18:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8A206141B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Apr 2021 12:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8A206141B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=perex.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50AA8842CB;
	Wed, 28 Apr 2021 12:18:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 41uKfcx5_ya0; Wed, 28 Apr 2021 12:18:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6451D8427E;
	Wed, 28 Apr 2021 12:18:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 453B0C0022;
	Wed, 28 Apr 2021 12:18:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61C74C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 12:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4739640537
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 12:18:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=perex.cz
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xPHffL-a7E85
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 12:18:35 +0000 (UTC)
X-Greylist: delayed 00:05:34 by SQLgrey-1.8.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2A56404EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 12:18:35 +0000 (UTC)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id BEDDDA0040;
 Wed, 28 Apr 2021 14:12:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz BEDDDA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1619611974; bh=E7fI2iK4OLn302MecYw4bgPCutXkNrdZfiQ/p9Bs2EQ=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=MTel574VKtUTT7xuzz+YjBoFIh1Pfni2/5qKyHpKz2jLEpf263CrlNBtDJKvWeDMY
 VzC0wlz9l7vqdLDZVKipnMmQOQqQAq3weFWFRfhprPGgy0215oj7TpiEcVqCaGKBsO
 SS4f4FDGadFMigu+n4AJBIBFEVut8NIa5XeYpNxU=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 28 Apr 2021 14:12:44 +0200 (CEST)
Subject: Re: [PATCH] drivers: pnp: proc.c: Removed unnecessary varibles
To: Shuah Khan <skhan@linuxfoundation.org>,
 Anupama K Patil <anupamakpatil123@gmail.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Adam <developer@arusty.dev>, bkkarthik@pesu.pes.edu,
 gregkh@linuxfoundation.org, kernelnewbies@kernelnewbies.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210422180322.7wlyg63kv3n2k6id@ubuntu>
 <ea09f455-a00f-a13d-29d8-e3f9790dba56@linuxfoundation.org>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <7526f0a3-b8bb-f751-50f9-4e71316178e0@perex.cz>
Date: Wed, 28 Apr 2021 14:12:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ea09f455-a00f-a13d-29d8-e3f9790dba56@linuxfoundation.org>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Dne 23. 04. 21 v 23:08 Shuah Khan napsal(a):
> On 4/22/21 12:03 PM, Anupama K Patil wrote:
>> de, e are two variables of the type 'struct proc_dir_entry'
>> which can be removed to save memory. This also fixes a coding style
>> issue reported by checkpatch where we are suggested to make assignment
>> outside the if statement.
>>
> 
> Sounds like a reasonable change.
> 
>> Signed-off-by: Anupama K Patil <anupamakpatil123@gmail.com>
>> ---
>>   drivers/pnp/isapnp/proc.c | 13 ++++++-------
>>   1 file changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/pnp/isapnp/proc.c b/drivers/pnp/isapnp/proc.c
>> index 785a796430fa..1ae458c02656 100644
>> --- a/drivers/pnp/isapnp/proc.c
>> +++ b/drivers/pnp/isapnp/proc.c
>> @@ -57,21 +57,20 @@ static const struct proc_ops isapnp_proc_bus_proc_ops = {
>>   static int isapnp_proc_attach_device(struct pnp_dev *dev)
>>   {
>>   	struct pnp_card *bus = dev->card;
>> -	struct proc_dir_entry *de, *e;
>>   	char name[16];
>>   
>> -	if (!(de = bus->procdir)) {
>> +	if (!bus->procdir) {
>>   		sprintf(name, "%02x", bus->number);
> 
> It would make sense to change this to scnprintf()

The name is 16 bytes, so sprintf is safe here.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
