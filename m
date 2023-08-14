Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918D1C001DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Aug 2023 22:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEA5860BBC;
	Mon, 14 Aug 2023 22:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEA5860BBC
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KVBokM2u
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id izChbWDwC9nH; Mon, 14 Aug 2023 22:50:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C19B760E4C;
	Mon, 14 Aug 2023 22:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C19B760E4C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 972EFC0071;
	Mon, 14 Aug 2023 22:50:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D13FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 22:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56C0960E4C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 22:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56C0960E4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xLA3Za8wa21D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 22:50:41 +0000 (UTC)
X-Greylist: delayed 1333 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 14 Aug 2023 22:50:41 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6927060BBC
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6927060BBC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 22:50:41 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37ELhZbL010009; Mon, 14 Aug 2023 22:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Wif1oq0DHEy5UWGIznmQNwtwGJzn/tUSejbg2LV0+xM=;
 b=KVBokM2uoMoHknU62NOnin0x/rC0oxv4dv3E14pJqbTq0j2cu798Iv7eNPsesOm51Fen
 wCO9xUWN/BqepLdwZaBqiG5CqiXb1eIOe/tA1BBrVHhms4i7DoxQVJ3JRYKoBKYKEuLh
 MVQ8wx7zgVZugQg70MR4fiVKbQF3s2iyiovy98lMcV2zjtwc1YWSTxR09IM+bJCZv5TB
 z+ECq5YOPrcmWxDNFM9b0YcW0QWueLJMxWUmXDsIlAaTagC2hPGxh9PsjEWoH8ou8Lam
 m+ENEfI1OfQve487usWuHneqmCGwM2CwKOQaoOtXBC+8iQzKI/QEx23SbrgOZ4ICy7wj SQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sfh74hgxx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Aug 2023 22:28:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37EMSKsM025357
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Aug 2023 22:28:20 GMT
Received: from [10.48.240.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 14 Aug
 2023 15:28:19 -0700
Message-ID: <01fc3da3-dc67-8873-dd59-f77a7d067f33@quicinc.com>
Date: Mon, 14 Aug 2023 15:28:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ath5k: fix WARNING opportunity for swap.
Content-Language: en-US
To: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>, <jirislaby@kernel.org>,
 <mickflemm@gmail.com>, <mcgrof@kernel.org>, <kvalo@kernel.org>,
 <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230814200234.637583-1-mahmoudmatook.mm@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230814200234.637583-1-mahmoudmatook.mm@gmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: YBU0J004caSdKnRzn9553Kp782crBrwO
X-Proofpoint-GUID: YBU0J004caSdKnRzn9553Kp782crBrwO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_18,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=929 phishscore=0
 priorityscore=1501 impostorscore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308140205
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On 8/14/2023 1:02 PM, Mahmoud Maatuq wrote:
> coccinielle reported the following:
> ./drivers/net/wireless/ath/ath5k/phy.c:1573:25-26: WARNING opportunity for swap()

Suggest you add something like:

This revealed that ath5k_hw_get_median_noise_floor() had open-coded 
sort() functionality. Since ath5k_hw_get_median_noise_floor() only 
executes once every 10 seconds, any extra overhead due to sort() calling 
it's "compare" and "swap" functions can be ignored, so replace the 
existing logic with a call to sort().

and before your SOB add:
Suggested-by: Jiri Slaby <jirislaby@kernel.org>

> Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
> ---
> changes in v1:
> - replace the entire double loop with sort()
>    as suggested by Jiri Slaby <jirislaby@kernel.org>
> ---
>   drivers/net/wireless/ath/ath5k/phy.c | 29 +++++++++++++---------------
>   1 file changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath5k/phy.c b/drivers/net/wireless/ath/ath5k/phy.c
> index 5797ef9c73d7..7ee4e1616f45 100644
> --- a/drivers/net/wireless/ath/ath5k/phy.c
> +++ b/drivers/net/wireless/ath/ath5k/phy.c
> @@ -26,6 +26,7 @@
>   
>   #include <linux/delay.h>
>   #include <linux/slab.h>
> +#include <linux/sort.h>
>   #include <asm/unaligned.h>
>   
>   #include "ath5k.h"
> @@ -1554,6 +1555,11 @@ static void ath5k_hw_update_nfcal_hist(struct ath5k_hw *ah, s16 noise_floor)
>   	hist->nfval[hist->index] = noise_floor;
>   }
>   
> +static int cmps16(const void *a, const void *b)
> +{
> +	return *(s16 *)a - *(s16 *)b;
> +}
> +
>   /**
>    * ath5k_hw_get_median_noise_floor() - Get median NF from history buffer
>    * @ah: The &struct ath5k_hw
> @@ -1561,25 +1567,16 @@ static void ath5k_hw_update_nfcal_hist(struct ath5k_hw *ah, s16 noise_floor)
>   static s16
>   ath5k_hw_get_median_noise_floor(struct ath5k_hw *ah)
>   {
> -	s16 sort[ATH5K_NF_CAL_HIST_MAX];
> -	s16 tmp;
> -	int i, j;
> -
> -	memcpy(sort, ah->ah_nfcal_hist.nfval, sizeof(sort));
> -	for (i = 0; i < ATH5K_NF_CAL_HIST_MAX - 1; i++) {
> -		for (j = 1; j < ATH5K_NF_CAL_HIST_MAX - i; j++) {
> -			if (sort[j] > sort[j - 1]) {
> -				tmp = sort[j];
> -				sort[j] = sort[j - 1];
> -				sort[j - 1] = tmp;
> -			}
> -		}
> -	}
> +	s16 sorted_nfval[ATH5K_NF_CAL_HIST_MAX];
> +	int i;
> +
> +	memcpy(sorted_nfval, ah->ah_nfcal_hist.nfval, sizeof(sorted_nfval));
> +	sort(sorted_nfval, ATH5K_NF_CAL_HIST_MAX, sizeof(s16), cmps16, NULL);
>   	for (i = 0; i < ATH5K_NF_CAL_HIST_MAX; i++) {
>   		ATH5K_DBG(ah, ATH5K_DEBUG_CALIBRATE,
> -			"cal %d:%d\n", i, sort[i]);
> +			"cal %d:%d\n", i, sorted_nfval[i]);
>   	}
> -	return sort[(ATH5K_NF_CAL_HIST_MAX - 1) / 2];
> +	return sorted_nfval[(ATH5K_NF_CAL_HIST_MAX - 1) / 2];
>   }
>   
>   /**

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
