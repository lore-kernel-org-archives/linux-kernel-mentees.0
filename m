Return-Path: <SRS0=wOYV=5D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84135C10DCE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 18:43:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6376520780
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 18:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6376520780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 44336266D9;
	Wed, 18 Mar 2020 18:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mlNQ4JyYalt9; Wed, 18 Mar 2020 18:43:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9798625DB6;
	Wed, 18 Mar 2020 18:43:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FEA3C18DA;
	Wed, 18 Mar 2020 18:43:19 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64BFBC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 18:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 615B0876CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 18:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H3l9loI4a-de
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 18:43:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0C789876C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 18:43:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,568,1574118000"; d="scan'208";a="441036846"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 19:43:14 +0100
Date: Wed, 18 Mar 2020 19:43:14 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200316100319.27935-16-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2003181942250.2979@hadrien>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
 <20200316100319.27935-16-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH 15/26] parsing_cocci:
 compute_lines: Add cases for ParenType/FunctionType
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



On Mon, 16 Mar 2020, Jaskaran Singh wrote:

> ParenType and FunctionType are now added to the SmPL ASTs. Add
> cases for these types in compute_lines.ml.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_cocci/compute_lines.ml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/parsing_cocci/compute_lines.ml b/parsing_cocci/compute_lines.ml
> index f4b6f4d8..8231a0e7 100644
> --- a/parsing_cocci/compute_lines.ml
> +++ b/parsing_cocci/compute_lines.ml
> @@ -574,6 +574,17 @@ and typeC t =
>        let rp2 = normal_mcode rp2 in
>        mkres t (Ast0.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2))
>  	ty (promote_mcode rp2)
> +  | Ast0.ParenType(lp,ty,rp) ->
> +      let lp = normal_mcode lp in
> +      let rp = normal_mcode rp in
> +      let ty = typeC ty in
> +      mkres t (Ast0.ParenType(lp,ty,rp)) ty (promote_mcode rp)

The type is not the leftmost thing.  So the third argument should be
(promote_mcode lp).

julia

> +  | Ast0.FunctionType(ty,lp,params,rp) ->
> +      let ty = typeC ty in
> +      let lp = normal_mcode lp in
> +      let params = parameter_list (Some(promote_mcode lp)) params in
> +      let rp = normal_mcode rp in
> +      mkres t (Ast0.FunctionType(ty,lp,params,rp)) ty (promote_mcode rp)
>    | Ast0.Array(ty,lb,size,rb) ->
>        let ty = typeC ty in
>        let lb = normal_mcode lb in
> --
> 2.21.1
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
