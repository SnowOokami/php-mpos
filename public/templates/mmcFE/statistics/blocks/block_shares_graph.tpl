{include file="global/block_header.tpl" BLOCK_HEADER="Block Shares" BLOCK_STYLE="clear:none;"}
<article class="module width_full">
<table width="70%" class="stats" rel="line">
  <caption>Block Shares</caption> 
  <thead>
    <tr>
{section block $BLOCKSFOUND step=-1}
      <th scope="col">{$BLOCKSFOUND[block].height}</th>
{/section}
    </th>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Expected</th>
{section block $BLOCKSFOUND step=-1}
      <td>{$BLOCKSFOUND[block].estshares}</td>
{/section}
    </tr>
    <tr>
      <th scope="row">Actual</th>
{section block $BLOCKSFOUND step=-1}
      <td>{$BLOCKSFOUND[block].shares}</td>
{/section}
   </tr>
    {if $GLOBAL.config.payout_system == 'pplns'}<tr>
      <th scope="row">PPLNS</th>
{section block $BLOCKSFOUND step=-1}
      <td>{$BLOCKSFOUND[block].pplns_shares}</td>
{/section}
   </tr>{/if}
    {if $USEBLOCKAVERAGE}<tr>
      <th scope="row">Average</th>
{section block $BLOCKSFOUND step=-1}
      <td>{$BLOCKSFOUND[block].block_avg}</td>
{/section}
   </tr>{/if}
  </tbody>
</table>

<table align="left" width="100%" border="0" style="font-size:13px;">
    <tbody>
      <tr>
        <td class="left">
          <a href="{$smarty.server.PHP_SELF}?page={$smarty.request.page}&action={$smarty.request.action}&height={if is_array($BLOCKSFOUND) && count($BLOCKSFOUND) > ($BLOCKLIMIT - 1)}{$BLOCKSFOUND[$BLOCKLIMIT - 1].height}{/if}&prev=1"><img src="{$PATH}/images/prev.png" /></a>
        </td>
        <td class="right">
          <a href="{$smarty.server.PHP_SELF}?page={$smarty.request.page}&action={$smarty.request.action}&height={if is_array($BLOCKSFOUND) && count($BLOCKSFOUND) > 0}{$BLOCKSFOUND[0].height}{/if}&next=1"><img src="{$PATH}/images/next.png" /></i></a>
        </td>
      </tr>
    </tbody>
  </table>
<center><br>
<p style="padding-left:30px; padding-redight:30px; font-size:10px;">
The graph above illustrates N shares to find a block vs. E Shares expected to find a block based on
target and network difficulty and assuming a zero variance scenario.
</p>
</article>
{include file="global/block_footer.tpl"}