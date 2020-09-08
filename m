Return-Path: <SRS0=zeZA=CR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MISSING_HEADERS,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D806EC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 23:40:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63E8D20936
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 23:40:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCKvxLSP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63E8D20936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F2FB487098;
	Tue,  8 Sep 2020 23:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J8nW3rMSubR3; Tue,  8 Sep 2020 23:40:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4390087096;
	Tue,  8 Sep 2020 23:40:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 284A3C0859;
	Tue,  8 Sep 2020 23:40:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09372C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 23:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E1E0727E4C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 23:40:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gVQol0OCePT0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 23:40:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id A391422F05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 23:40:12 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id y6so951plt.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Sep 2020 16:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:cc:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=hlDVAxiOXkRKboZyuXLRZYuEvx2EuGrMs+4z282NJ3Y=;
 b=QCKvxLSP+l1V9OAeyZI/eFqDi+o8xjfqGqlnLNw2npgUS4C+jvj4OFa8mylIOnw3Ya
 6XQ4b+YzF5X9xeqEUid7qQRjOB9Dem84hWXdxpsGL8sjROMTUh3iAWiNrNF9M3+rWL7n
 n9sok6QaHG4mV+vLLGOTzpaidSM9QmP8YgreeIXtxitNsKvIN0/6QDYW8gmYt1rVuZIk
 WvUvncHViZB02CafjeKUSYsZvHB0/zVBwTC8G0NsLQOQ9JjvpVBi/P7vIRRDy2di+afK
 mnWtbJTUj/fdx2pcCy+yHdsQp4kGxuuMSzg54VuGNCehCOYmakULd1OvB5Hkwwss6Liw
 Za5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=hlDVAxiOXkRKboZyuXLRZYuEvx2EuGrMs+4z282NJ3Y=;
 b=s40krGIw6dpOZitWLgA7MAjyBzDyn5nSSK/6tKSgflRTy6oHeacm1Z4iYukR0U6LQt
 h5I1pHQInyC3liwK8m2UMnF0DC+5NsI+GGvKKutZzjowbmBI9SXJVrLdFTlvimmMnZYD
 OnKEkKKNJ8Bv8dx50kzht2t73nAe/JFgK042Of6iwGNyIyc7QxHwpfwrcGvnFlqFSn4+
 FDBj4KZSIOZDyyZNObSXqMrVsU65KqTaEg5pU/GtjD9Y5aSQOREpPsKoUkRkyhC7qAHv
 3hPy1xPXmzocEyhWCN1baUwpDmwXRyliQqQJSQ7ES9j+7e4uH+fx+9S63ZeCokvesM/L
 NWDg==
X-Gm-Message-State: AOAM533nOeuqc7e6PA7CrVtq5WzFaqgTGpu9YvywDuqjIFmhq5Jyg5Mj
 o487B9xr/zzR/sXH0sRZ/AY=
X-Google-Smtp-Source: ABdhPJy8Y2WGjmhgmk0S8gNJ7jMT9iROaroU3DMIfr/Z94bKZkvSEbg5xsHM6Wzs15kPEkaLO+/14w==
X-Received: by 2002:a17:902:bb84:: with SMTP id
 m4mr1003130pls.90.1599608411843; 
 Tue, 08 Sep 2020 16:40:11 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.193.206])
 by smtp.gmail.com with ESMTPSA id 31sm310969pgs.59.2020.09.08.16.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 16:40:11 -0700 (PDT)
References: <20200908233329.200473-1-anant.thazhemadam@gmail.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <03d5b23d-b81a-f9b2-c42d-90b3a8e021f2@gmail.com>
Date: Wed, 9 Sep 2020 05:10:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908233329.200473-1-anant.thazhemadam@gmail.com>
Content-Language: en-US
Cc: syzbot+c613e88b3093ebf3686e@syzkaller.appspotmail.com,
 syzbot+0f84f6eed90503da72fc@syzkaller.appspotmail.com,
 Masahiro Yamada <masahiroy@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 netdev@vger.kernel.org, syzbot+d0f27d9af17914bf253b@syzkaller.appspotmail.com,
 syzbot+3025b9294f8cb0ede850@syzkaller.appspotmail.com,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] net: qrtr: Reintroduce ARCH_QCOM
	as a dependency for QRTR
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


On 09/09/20 5:03 am, Anant Thazhemadam wrote:
> Removing ARCH_QCOM, as a dependency for QRTR begins to give rise to
> issues with respect to maintaining reference count integrity and
> suspicious rcu usage.
>
> The bugs resolved by making QRTR dependent on ARCH_QCOM include:
>
> * WARNING: refcount bug in qrtr_node_lookup
> Reported-by: syzbot+c613e88b3093ebf3686e@syzkaller.appspotmail.com
> * WARNING: refcount bug in qrtr_recvmsg
> Reported-by: syzbot+d0f27d9af17914bf253b@syzkaller.appspotmail.com
> * WARNING: suspicious RCU usage in ctrl_cmd_new_lookup
> Reported-by: syzbot+3025b9294f8cb0ede850@syzkaller.appspotmail.com
> * WARNING: suspicious RCU usage in qrtr_ns_worker
> Reported-by: syzbot+0f84f6eed90503da72fc@syzkaller.appspotmail.com
>
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> ---
> As I understand it, QRTR was initially dependent upon ARCH_QCOM, but was 
> removed since not all modems using IPC Router protocol required the 
> support provided for Qualcomm platforms. 
> However, wouldn't ARCH_QCOM be required by the modems that require the 
> support provided for Qualcomm platforms?
> The configuration ARCH_QCOM isn't exactly the easiest to find, especially, 
> for those who don't know what they're looking for (syzbot included, I 
> guess).
> I don't feel like the tradeoff of not depending on ARCH_QCOM over giving 
> rise to potential bugs is worth it. 
> Is NOT having QRTR depend on ARCH_QCOM so critical that it supersedes the 
> priority of not giving rise to potential bugs?
>
>  net/qrtr/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/net/qrtr/Kconfig b/net/qrtr/Kconfig
> index b4020b84760f..8156d0f3656b 100644
> --- a/net/qrtr/Kconfig
> +++ b/net/qrtr/Kconfig
> @@ -4,6 +4,7 @@
>  
>  config QRTR
>  	tristate "Qualcomm IPC Router support"
> +	depends on ARCH_QCOM
>  	help
>  	  Say Y if you intend to use Qualcomm IPC router protocol.  The
>  	  protocol is used to communicate with services provided by other
I believe I've been mistaken. I realize, requiring ARCH_QCOM wouldn't
extend functionality, but would limit it to ONLY Qualcomm platforms.
That makes sense, and would also explain the false positive results
obtained when tried to test with syzbot, since syzbot wouldn't be
able to build in the first place.

Sorry for the trouble, you may ignore this patch.

thanks,
Anant

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
