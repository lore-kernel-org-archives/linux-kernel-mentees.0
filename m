Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0433428A1E6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761561357; cv=none; b=cruwVBV5I5MgIVmL8BD6ofbf8cYXma+aFVtSBwZTTb/QCZwlx6uLC5pzIy9hsIgRXYq0t+CsTYbUfMK3P4IURs+99rqV0UWj9KB1bY4t9DTSloNBygntSesO3WfIIU6aJTA3qELYtYMhbmJzYpneF5VKnMMos6zBg9/J69DChpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761561357; c=relaxed/simple;
	bh=SQBuNsRqqdj8/7b8hx6Gcd/hWl54K9RgVTNi0Hm0Kho=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eybmGtufBR8RsWzID+bcY2oxyVqBC3AWXjXydEByLUeEge4azyEpC4NtBvkvF/Ur6kgNN35HVmpIA6+H2VXoZaRLrW1Smt3lpsUsYf+6jxW3cKMUqtThnHzDKaFeL8han83dN4kXzNjN1ajens3nITPS2FR1OkJIZSXz8MgbtD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=Ny1kEvvM; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="Ny1kEvvM"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B1C4840BC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 10:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.091
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQsL0mg4w6EA for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Oct 2025 10:35:54 +0000 (UTC)
X-Greylist: delayed 626 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 27 Oct 2025 10:35:54 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A8C1840BB
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A8C1840BB
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=Ny1kEvvM
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=35.157.23.187; helo=relayaws-01.paragon-software.com; envelope-from=almaz.alexandrovich@paragon-software.com; receiver=<UNKNOWN> 
Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5A8C1840BB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 10:35:54 +0000 (UTC)
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 1F9F41D24;
	Mon, 27 Oct 2025 10:21:53 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=Ny1kEvvM;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id CA8F8217E;
	Mon, 27 Oct 2025 10:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1761560687;
	bh=y1JvDIp1oNzIWo8rgtPOFtXMHW2j570whSBQvdvv6h8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Ny1kEvvM5yJiEY1KgCrvP5JwqALzKdy4ck1+Shf7YvRYUtI/8MgDWX6tEpwpq4yCq
	 IH5yE4er/Edlk8CKjWj6NzNmxdmr5H5uvny26NMcqjge+SHa6sRk7EON+LrS6hIlCq
	 hM+yDW1+BXAK/irV2N/qDAyLGJ0wAQ7FJ5EeCsUQ=
Received: from [192.168.95.128] (172.30.20.206) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 27 Oct 2025 13:24:46 +0300
Message-ID: <d3d93d11-9895-4d4b-853d-729be06ead4e@paragon-software.com>
Date: Mon, 27 Oct 2025 11:24:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: fix KMSAN uninit-value in ni_create_attr_list
To: Nirbhay Sharma <nirbhay.lkd@gmail.com>
CC: <david.hunter.linux@gmail.com>, <skhan@linuxfoundation.org>,
	<linux-kernel-mentees@lists.linuxfoundation.org>, <khalid@kernel.org>,
	<syzbot+83c9dd5c0dcf6184fdbf@syzkaller.appspotmail.com>,
	<ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20251006223805.139206-1-nirbhay.lkd@gmail.com>
 <4aeceb66-ceea-4171-8806-95bd11a928b3@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <4aeceb66-ceea-4171-8806-95bd11a928b3@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 10/25/25 17:07, Nirbhay Sharma wrote:
>
>
> On 10/7/25 4:08 AM, Nirbhay Sharma wrote:
>> The call to kmalloc() to allocate the attribute list buffer is given a
>> size of al_aligned(rs). This size can be larger than the data
>> subsequently copied into the buffer, leaving trailing bytes 
>> uninitialized.
>>
>> This can trigger a KMSAN "uninit-value" warning if that memory is
>> later accessed.
>>
>> Fix this by using kzalloc() instead, which ensures the entire
>> allocated buffer is zero-initialized, preventing the warning.
>>
>> Reported-by: syzbot+83c9dd5c0dcf6184fdbf@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=83c9dd5c0dcf6184fdbf
>> Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
>> ---
>> The following syzbot test commands were used to verify the fix against
>> both linux-next and a specific mainline commit. Both kernels were
>> configured with CONFIG_KMSAN=y, and no KMSAN warnings were observed
>> with the patch applied.
>>
>> An attempt to test against the latest mainline tip failed due to an
>> unrelated boot failure in the SCSI subsystem (KMSAN: use-after-free in
>> scsi_get_vpd_buf). Therefore, testing was done on the last known-good
>> mainline commit below.
>>
>> For mainline commit 9b0d551bcc05 ("Merge tag 'pull-misc' of..."):
>> #syz test: 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 
>> 9b0d551bcc05
>>
>> For the linux-next branch:
>> #syz test: 
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
>> master
>>
>>   fs/ntfs3/frecord.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
>> index 8f9fe1d7a690..4fe8da7fc034 100644
>> --- a/fs/ntfs3/frecord.c
>> +++ b/fs/ntfs3/frecord.c
>> @@ -767,7 +767,7 @@ int ni_create_attr_list(struct ntfs_inode *ni)
>>        * Skip estimating exact memory requirement.
>>        * Looks like one record_size is always enough.
>>        */
>> -    le = kmalloc(al_aligned(rs), GFP_NOFS);
>> +    le = kzalloc(al_aligned(rs), GFP_NOFS);
>>       if (!le)
>>           return -ENOMEM;
> Hi Konstantin,
>
> I sent this patch about 3 weeks ago and haven't heard back yet. I wanted
> to check if there are any concerns with the patch or if any changes are
> needed. The fix addresses a KMSAN uninit-value bug and has been tested
> successfully on both linux-next and the commit from the syzbot report.
>
> Please let me know if you need any additional information or testing.
>
> Thanks,
> Nirbhay

Hello,

Your patch has been applied, but it hasn’t been pushed to our repository
yet. It will be there as soon as possible.

I’ll let you know once it’s merged into kernel. Thanks for your patience.

Regards,
Konstantin

