Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81523E784BF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Oct 2023 15:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E0344085A;
	Mon,  2 Oct 2023 15:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E0344085A
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marliere.net header.i=ricardo@marliere.net header.a=rsa-sha256 header.s=zmail header.b=pAHgML6n
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zIAfgxM3w-JC; Mon,  2 Oct 2023 15:56:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DC2B04051E;
	Mon,  2 Oct 2023 15:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC2B04051E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C085BC0071;
	Mon,  2 Oct 2023 15:56:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46BC4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 15:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22C4660FE5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 15:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22C4660FE5
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=marliere.net header.i=ricardo@marliere.net
 header.a=rsa-sha256 header.s=zmail header.b=pAHgML6n
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jBif3tyYoHcJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 15:56:13 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79A3660D9D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 15:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79A3660D9D
ARC-Seal: i=1; a=rsa-sha256; t=1696262169; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bllaTzVNbyu3v5rSag5SGswSywadTc7l+pz7OIWiUIgbnoFAC7tmkOhfNavYkkf+hKSy/qOsMSp52sBbdfJq1y81miIdw6LsM1Xr3ADFksFrCsLKjV8uVxZoX9GdJ/tGZcxuFPTpG9hv/IdA1Rw936YiSFCkEVbrxo/EqES/z+E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1696262169;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=2GsfzeECTPPTE4gpp5vVnHomCT5yBhjA+mpLuL9YQB0=; 
 b=XhOUETY6Y0q5vZAL4DymkpE4HJhof9eO/8hcV4F2lxwMye/7yHc1wO0QtwSpN2CGZmsIqiOwa8zlGiLIrb4DQ54ew02ZnFa+4Z6IpTDE0RWe5CT9hJgjSi3SnjKA1Cp/lD6E5YoeBl/lztwFEQOnscXf8S2W+J3DuOZx1krnZ+A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=marliere.net;
 spf=pass  smtp.mailfrom=ricardo@marliere.net;
 dmarc=pass header.from=<ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1696262169; 
 s=zmail; d=marliere.net; i=ricardo@marliere.net;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=2GsfzeECTPPTE4gpp5vVnHomCT5yBhjA+mpLuL9YQB0=;
 b=pAHgML6ntB+okEhJCtDSELRJlzce1azIHNbF/34Qbyt9za/mNB6WNa2wB9c+o0Uh
 ybYhDUHvXiRthBQDB7gV4EnjYD14fZZsxRju5piZoQBxZQziGCpU5FqPMYotkYQj8Bq
 fT1elOkp/S5UdwXjplGMCwwHdF+btsCTl0Ybd+4k=
Received: from localhost (177.104.93.54 [177.104.93.54]) by mx.zohomail.com
 with SMTPS id 1696262167246993.2648287452104;
 Mon, 2 Oct 2023 08:56:07 -0700 (PDT)
Date: Mon, 2 Oct 2023 12:56:03 -0300
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Juntong Deng <juntong.deng@outlook.com>
Subject: Re: [PATCH v2] fs/jfs: Add check for negative db_l2nbperpage
Message-ID: <c52zvpisqgy6nvtw3fku342z5aqmz5gucfagaup2tflw5ia5d7@vbeanlsfhgqp>
References: <VI1P193MB0752E63048A98BC70E4CFA9E99C5A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1P193MB0752E63048A98BC70E4CFA9E99C5A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
X-ZohoMailClient: External
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, liushixin2@huawei.com,
 syzbot+debee9ab7ae2b34b0307@syzkaller.appspotmail.com, wuhoipok@gmail.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 23/10/02 05:56PM, Juntong Deng wrote:
> Signed-off-by: Juntong Deng <juntong.deng@outlook.com>
> ---
>  fs/jfs/jfs_dmap.c | 3 ++-

Hey there, looks like you forgot to add a changelog for v1->v2? I see
you just changed the commit tags ordering but you should have that in
mind for next time :)

-	Ricardo
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
