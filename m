Return-Path: <SRS0=gpyO=6R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CD8C28CBC
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  3 May 2020 19:29:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B23B22068E
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  3 May 2020 19:29:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B23B22068E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8D96D87C5B;
	Sun,  3 May 2020 19:29:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6LrVGidnuS7j; Sun,  3 May 2020 19:29:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E0B7787CA4;
	Sun,  3 May 2020 19:29:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CEE48C0176;
	Sun,  3 May 2020 19:29:56 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6BD7FC0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 May 2020 19:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 597E587CA4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 May 2020 19:29:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCaNRjP-iFsG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 May 2020 19:29:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 122E487C5B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 May 2020 19:29:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.73,349,1583190000"; d="scan'208";a="347593932"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2020 21:29:51 +0200
Date: Sun, 3 May 2020 21:29:51 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200428170228.7002-16-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2005032129380.2533@hadrien>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
 <20200428170228.7002-16-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, linux-kernel-mentees@lists.linuxfoundation.org,
 cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH 15/32] parsing_cocci:
 visitor_ast: Visit cast attributes
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



On Tue, 28 Apr 2020, Jaskaran Singh wrote:

> Cast attributes are added to AST0 of SmPL. Visit these attributes in the

AST0 -> AST

julia

> SmPL AST visitor.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_cocci/visitor_ast.ml | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/parsing_cocci/visitor_ast.ml b/parsing_cocci/visitor_ast.ml
> index 8e530114..644bcd5d 100644
> --- a/parsing_cocci/visitor_ast.ml
> +++ b/parsing_cocci/visitor_ast.ml
> @@ -198,12 +198,13 @@ let combiner bind option_default
>  	  let lar = string_mcode ar in
>  	  let lfield = ident field in
>  	  multibind [lexp; lar; lfield]
> -      | Ast.Cast(lp,ty,rp,exp) ->
> +      | Ast.Cast(lp,ty,attr,rp,exp) ->
>  	  let llp = string_mcode lp in
>  	  let lty = fullType ty in
> +	  let lattr = multibind (List.map string_mcode attr) in
>  	  let lrp = string_mcode rp in
>  	  let lexp = expression exp in
> -	  multibind [llp; lty; lrp; lexp]
> +          multibind [llp; lty; lattr; lrp; lexp]
>        | Ast.SizeOfExpr(szf,exp) ->
>  	  let lszf = string_mcode szf in
>  	  let lexp = expression exp in
> @@ -1184,12 +1185,13 @@ let rebuilder
>  	    let lar = string_mcode ar in
>  	    let lfield = ident field in
>  	    Ast.RecordPtAccess(lexp, lar, lfield)
> -	| Ast.Cast(lp,ty,rp,exp) ->
> +	| Ast.Cast(lp,ty,attr,rp,exp) ->
>  	    let llp = string_mcode lp in
>  	    let lty = fullType ty in
> +	    let lattr = List.map string_mcode attr in
>  	    let lrp = string_mcode rp in
>  	    let lexp = expression exp in
> -	    Ast.Cast(llp, lty, lrp, lexp)
> +	    Ast.Cast(llp, lty, lattr, lrp, lexp)
>  	| Ast.SizeOfExpr(szf,exp) ->
>  	    let lszf = string_mcode szf in
>  	    let lexp = expression exp in
> --
> 2.21.1
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
