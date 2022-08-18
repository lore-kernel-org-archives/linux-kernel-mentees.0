Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B05C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Aug 2022 11:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9115941151;
	Thu, 18 Aug 2022 11:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9115941151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FkVrY1l7uURD; Thu, 18 Aug 2022 11:22:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4E26340166;
	Thu, 18 Aug 2022 11:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E26340166
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D432C0032;
	Thu, 18 Aug 2022 11:22:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0876AC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Aug 2022 11:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C94778405F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Aug 2022 11:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C94778405F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UdSP8xNXueTa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Aug 2022 11:22:24 +0000 (UTC)
X-Greylist: delayed 00:09:07 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF4388405D
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF4388405D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Aug 2022 11:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by a.mx.secunet.com (Postfix) with ESMTP id 2883F20538;
 Thu, 18 Aug 2022 13:13:14 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
 by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lked6gCadlW7; Thu, 18 Aug 2022 13:13:13 +0200 (CEST)
Received: from mailout2.secunet.com (mailout2.secunet.com [62.96.220.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by a.mx.secunet.com (Postfix) with ESMTPS id A1C2820519;
 Thu, 18 Aug 2022 13:13:13 +0200 (CEST)
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
 by mailout2.secunet.com (Postfix) with ESMTP id 8ED5B80004A;
 Thu, 18 Aug 2022 13:13:13 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 18 Aug 2022 13:13:13 +0200
Received: from gauss2.secunet.de (10.182.7.193) by mbx-essen-01.secunet.de
 (10.53.40.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 18 Aug
 2022 13:13:13 +0200
Received: by gauss2.secunet.de (Postfix, from userid 1000)
 id AB11A3182AA7; Thu, 18 Aug 2022 13:13:12 +0200 (CEST)
Date: Thu, 18 Aug 2022 13:13:12 +0200
From: Steffen Klassert <steffen.klassert@secunet.com>
To: Gautam Menghani <gautammenghani201@gmail.com>
Subject: Re: [PATCH v3] selftests/net: Refactor xfrm_fill_key() to use array
 of structs
Message-ID: <20220818111312.GH566407@gauss3.secunet.de>
References: <55c8de7e-a6e8-fc79-794d-53536ad7a65d@collabora.com>
 <20220806163530.70182-1-gautammenghani201@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220806163530.70182-1-gautammenghani201@gmail.com>
X-ClientProxiedBy: cas-essen-02.secunet.de (10.53.40.202) To
 mbx-essen-01.secunet.de (10.53.40.197)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
Cc: herbert@gondor.apana.org.au, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, edumazet@google.com,
 linux-kselftest@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 shuah@kernel.org, davem@davemloft.net,
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

On Sat, Aug 06, 2022 at 10:05:30PM +0530, Gautam Menghani wrote:
> A TODO in net/ipsec.c asks to refactor the code in xfrm_fill_key() to
> use set/map to avoid manually comparing each algorithm with the "name" 
> parameter passed to the function as an argument. This patch refactors 
> the code to create an array of structs where each struct contains the 
> algorithm name and its corresponding key length.
> 
> Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>

Applied to ipsec-next, thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
