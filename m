Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4427AC001DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Aug 2023 14:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DFF1402BA;
	Mon,  7 Aug 2023 14:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DFF1402BA
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S1WdKG5Y
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zJxiVVrroP6U; Mon,  7 Aug 2023 14:44:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 37F6F4021B;
	Mon,  7 Aug 2023 14:44:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37F6F4021B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 046B2C0071;
	Mon,  7 Aug 2023 14:44:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35EBFC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 14:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0F6740A57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 14:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0F6740A57
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.a=rsa-sha256 header.s=qcppdkim1 header.b=S1WdKG5Y
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZnHIn-PDR40U
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 14:44:30 +0000 (UTC)
X-Greylist: delayed 1860 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 07 Aug 2023 14:44:29 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6FA6404FF
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6FA6404FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 14:44:29 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3778eCqw024287; Mon, 7 Aug 2023 14:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Gt+gCUHmgDjj2zNUxEfs8O41tYDOTQH90wdcsrwitAc=;
 b=S1WdKG5Y5q3RgokRD85oKHJKd5mUZNVUJgd3j02B25wuR/5W/GOtxIMEHOW2FTzVj/gj
 gtUJzOVBgpGkDOAahRQgUoLP8ECkwKI9wtqRPJ6rcAZqadZKcpjtF6E1VOqkZY+TlmN6
 Orty990YVLgJDPKu0lJHam1suD8vnOHmbSHiheDrVFiww/g2hB0IFFuFHVKkhAjLh8jQ
 W8ZO/VSWVwApsQQRVbCEsGQbHSiZotZpt/MxwWgX7zcm5zJNp/Yy7FvG7elkWla/XGgq
 CMpKsU7bJg10EWG9HI2P9ktmiEH5XEqbi13C7/R8y23S7sUP/TlZ9n8P6LkH7bMlQTP7 ig== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3saw0r8s43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Aug 2023 14:13:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 377EDLRJ028863
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 7 Aug 2023 14:13:21 GMT
Received: from [10.111.180.219] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 7 Aug
 2023 07:13:21 -0700
Message-ID: <47f1a06b-8bfe-911a-3a05-da7d522b588f@quicinc.com>
Date: Mon, 7 Aug 2023 07:13:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ath6kl: replace one-element array with flexible-array
 member
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>, Kalle Valo <kvalo@kernel.org>
References: <20230804045554.6934-1-rauji.raut@gmail.com>
 <2023080433-patio-staining-2cfe@gregkh> <87sf8zs2oi.fsf@kernel.org>
 <2023080410-unadorned-vertigo-c0b8@gregkh>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <2023080410-unadorned-vertigo-c0b8@gregkh>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: g6PxgHzzUW0wA2SGSy-RByiRbc4Ag86W
X-Proofpoint-ORIG-GUID: g6PxgHzzUW0wA2SGSy-RByiRbc4Ag86W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_13,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 impostorscore=0 mlxlogscore=502 clxscore=1011
 spamscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308070131
Cc: Atul Raut <rauji.raut@gmail.com>, linux-wireless@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

On 8/4/2023 2:30 AM, Greg KH wrote:
> On Fri, Aug 04, 2023 at 10:10:37AM +0300, Kalle Valo wrote:
>> Greg KH <gregkh@linuxfoundation.org> writes:
>>
>>> On Thu, Aug 03, 2023 at 09:55:54PM -0700, Atul Raut wrote:
>>>
>>>> One-element arrays are no longer relevant, and their
>>>> place has been taken by flexible array members thus,
>>>> use a flexible-array member to replace the one-element
>>>> array in struct ath6kl_usb_ctrl_diag_cmd_write
>>>>
>>>> This fixes warnings such as:
>>>> ./drivers/net/wireless/ath/ath6kl/usb.c:109:8-12: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
>>>>
>>>> Signed-off-by: Atul Raut <rauji.raut@gmail.com>
>>>> ---
>>>>   drivers/net/wireless/ath/ath6kl/usb.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/net/wireless/ath/ath6kl/usb.c b/drivers/net/wireless/ath/ath6kl/usb.c
>>>> index 5220809841a6..c8ecc9e85897 100644
>>>> --- a/drivers/net/wireless/ath/ath6kl/usb.c
>>>> +++ b/drivers/net/wireless/ath/ath6kl/usb.c
>>>> @@ -106,7 +106,7 @@ struct ath6kl_usb_ctrl_diag_cmd_write {
>>>>   	__le32 cmd;
>>>>   	__le32 address;
>>>>   	__le32 value;
>>>> -	__le32 _pad[1];
>>>> +	__le32 _pad[];
>>>
>>> Are you sure this is actually a variable length array?
>>
>> It's not, it's just padding. We both told this in v1:
>>
>> https://patchwork.kernel.org/project/linux-wireless/patch/20230731012941.21875-1-rauji.raut@gmail.com/
> 
> Hey, I'm consistent, nice!  :)
> 
> But Atul, that's not good to ignore our review comments.  Usually that
> ends up meaning that everyone will then just ignore your submissions,
> generally a not-good resolution.
> 
> thanks,
> 
> greg k-h

Since the 'pad' field is never directly accessed, suggest the author 
respin this this to use simply:
	__le32 _pad;

That will prevent others from trying to "fix" this actual one-element 
array in the future.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
