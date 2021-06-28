Return-Path: <SRS0=s8/Q=LW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E1CBC49EAB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Jun 2021 09:43:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2DE361C49
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Jun 2021 09:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2DE361C49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tuxera.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97C4F40221;
	Mon, 28 Jun 2021 09:43:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cGZMggFbyR4o; Mon, 28 Jun 2021 09:43:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AFA89400B9;
	Mon, 28 Jun 2021 09:43:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8966BC0010;
	Mon, 28 Jun 2021 09:43:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 662ACC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 09:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40D68402A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 09:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J3H06cpVyWEk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 09:43:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mgw-02.mpynet.fi (mgw-02.mpynet.fi [82.197.21.91])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6A6F40198
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 09:43:30 +0000 (UTC)
Received: from pps.filterd (mgw-02.mpynet.fi [127.0.0.1])
 by mgw-02.mpynet.fi (8.16.0.43/8.16.0.43) with SMTP id 15S9MlX9115831;
 Mon, 28 Jun 2021 12:22:55 +0300
Received: from ex13.tuxera.com (ex13.tuxera.com [178.16.184.72])
 by mgw-02.mpynet.fi with ESMTP id 39f9xh82u4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 12:22:55 +0300
Received: from tuxera-exch.ad.tuxera.com (10.20.48.11) by
 tuxera-exch.ad.tuxera.com (10.20.48.11) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Mon, 28 Jun 2021 12:22:54 +0300
Received: from tuxera-exch.ad.tuxera.com ([fe80::552a:f9f0:68c3:d789]) by
 tuxera-exch.ad.tuxera.com ([fe80::552a:f9f0:68c3:d789%12]) with mapi id
 15.00.1497.018; Mon, 28 Jun 2021 12:22:54 +0300
From: Anton Altaparmakov <anton@tuxera.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH] ntfs: Fix validity check for file name attribute
Thread-Topic: [PATCH] ntfs: Fix validity check for file name attribute
Thread-Index: AQHXYNr9xtdXtYfpBEGmty8mpcDGlasom2mAgABu7oA=
Date: Mon, 28 Jun 2021 09:22:53 +0000
Message-ID: <A2D2BB3D-8C89-40D7-B0CF-F1D2B5176152@tuxera.com>
References: <20210614050540.289494-1-desmondcheongzx@gmail.com>
 <ea63e5af-6ac4-08fe-4261-904d55392b10@gmail.com>
In-Reply-To: <ea63e5af-6ac4-08fe-4261-904d55392b10@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [86.134.197.70]
Content-ID: <E46CF24098D589409656063DFF65A21C@ex13.tuxera.com>
MIME-Version: 1.0
X-Proofpoint-GUID: bS1-7ry4khBlczmL-2VT3CuiwRDQWvHJ
X-Proofpoint-ORIG-GUID: bS1-7ry4khBlczmL-2VT3CuiwRDQWvHJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_07:2021-06-25,
 2021-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=mpy_notspam policy=mpy score=0 phishscore=0
 bulkscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106280065
Cc: "linux-ntfs-dev@lists.sourceforge.net"
 <linux-ntfs-dev@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "syzbot+213ac8bb98f7f4420840@syzkaller.appspotmail.com"
 <syzbot+213ac8bb98f7f4420840@syzkaller.appspotmail.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
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

Hi,

Thanks for the patch!  Have asked Andrew to merge it.

Best regards,

	Anton

> On 28 Jun 2021, at 03:45, Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com> wrote:
> 
> On 14/6/21 1:05 pm, Desmond Cheong Zhi Xi wrote:
>> When checking the file name attribute, we want to ensure that it fits
>> within the bounds of ATTR_RECORD. To do this, we should check
>> that (attr record + file name offset + file name length) < (attr
>> record + attr record length).
>> However, the original check did not include the file name offset in
>> the calculation. This means that corrupted on-disk metadata might not
>> caught by the incorrect file name check, and lead to an invalid memory
>> access.
>> An example can be seen in the crash report of a memory corruption
>> error found by Syzbot:
>> https://syzkaller.appspot.com/bug?id=a1a1e379b225812688566745c3e2f7242bffc246
>> Adding the file name offset to the validity check fixes this error and
>> passes the Syzbot reproducer test.
>> Reported-by: syzbot+213ac8bb98f7f4420840@syzkaller.appspotmail.com
>> Tested-by: syzbot+213ac8bb98f7f4420840@syzkaller.appspotmail.com
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> ---
>>  fs/ntfs/inode.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
>> index f5c058b3192c..4474adb393ca 100644
>> --- a/fs/ntfs/inode.c
>> +++ b/fs/ntfs/inode.c
>> @@ -477,7 +477,7 @@ static int ntfs_is_extended_system_file(ntfs_attr_search_ctx *ctx)
>>  		}
>>  		file_name_attr = (FILE_NAME_ATTR*)((u8*)attr +
>>  				le16_to_cpu(attr->data.resident.value_offset));
>> -		p2 = (u8*)attr + le32_to_cpu(attr->data.resident.value_length);
>> +		p2 = (u8 *)file_name_attr + le32_to_cpu(attr->data.resident.value_length);
>>  		if (p2 < (u8*)attr || p2 > p)
>>  			goto err_corrupt_attr;
>>  		/* This attribute is ok, but is it in the $Extend directory? */
> 
> Hi Anton,
> 
> Any chance to review this patch?
> 
> Best wishes,
> Desmond


-- 
Anton Altaparmakov <anton at tuxera.com> (replace at with @)
Lead in File System Development, Tuxera Inc., http://www.tuxera.com/
Linux NTFS maintainer

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
