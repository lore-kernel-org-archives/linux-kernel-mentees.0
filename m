Return-Path: <SRS0=gpyO=6R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A332BC28CBC
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  3 May 2020 19:26:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74E782054F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  3 May 2020 19:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74E782054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 684D787D56;
	Sun,  3 May 2020 19:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qGVzdg338bgn; Sun,  3 May 2020 19:26:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C89C687D24;
	Sun,  3 May 2020 19:26:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C18B1C0176;
	Sun,  3 May 2020 19:26:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B10B7C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 May 2020 19:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A5EF18836C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 May 2020 19:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0eA+akdmUNHU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 May 2020 19:26:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6610A88328
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 May 2020 19:26:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.73,349,1583190000"; d="scan'208";a="347593809"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2020 21:26:07 +0200
Date: Sun, 3 May 2020 21:26:07 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200428170228.7002-4-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2005032125380.2533@hadrien>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
 <20200428170228.7002-4-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH 03/32] parsing_cocci: parser:
	Parse cast attributes
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

> Cast attributes are added to the SmPL ASTs. Parse these attributes in
> the SmPL parser and place them in the SmPL AST. The added production
> only supports attributes after the type and before the expression.

It would be good to say that on matching the attributes will be searched
for anywhere, if that is the case.

julia

>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_cocci/parser_cocci_menhir.mly | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/parsing_cocci/parser_cocci_menhir.mly b/parsing_cocci/parser_cocci_menhir.mly
> index db5661bd..38b0e039 100644
> --- a/parsing_cocci/parser_cocci_menhir.mly
> +++ b/parsing_cocci/parser_cocci_menhir.mly
> @@ -2176,11 +2176,12 @@ arith_expr_bis:
>
>  cast_expr(r,pe):
>      unary_expr(r,pe)                      { $1 }
> -  | lp=TOPar t=ctype rp=TCPar e=cast_expr(r,pe)
> -      { Ast0.wrap(Ast0.Cast (P.clt2mcode "(" lp, t,
> +  | lp=TOPar t=ctype ar=attr_list rp=TCPar e=cast_expr(r,pe)
> +      { Ast0.wrap(Ast0.Cast (P.clt2mcode "(" lp, t, ar,
>                               P.clt2mcode ")" rp, e)) }
> -  | lp=TOPar t=ctype d=direct_abstract_d rp=TCPar e=cast_expr(r,pe)
> -      { Ast0.wrap(Ast0.Cast (P.clt2mcode "(" lp, d t,
> +  | lp=TOPar t=ctype d=direct_abstract_d ar=attr_list rp=TCPar
> +    e=cast_expr(r,pe)
> +      { Ast0.wrap(Ast0.Cast (P.clt2mcode "(" lp, d t, ar,
>  			     P.clt2mcode ")" rp, e)) }
>
>  unary_expr(r,pe):
> --
> 2.21.1
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
